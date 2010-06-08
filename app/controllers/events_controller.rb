class EventsController < ApplicationController
  
  before_filter :require_user
  
  def new
    @title = "Create Event"
    @event = Event.new(:endtime => 1.hour.from_now, :period => "Does not repeat")
  end
  
  def new_university
    @event = Event.new(:endtime => 1.hour.from_now, :period => "Does not repeat")
  end
  
  def create
    if params[:event][:period] == "Does not repeat"
      @event = Event.new(params[:event])
      @event.creator_id = @current_user.id
      @event.save
      redirect_to '/events'
    else
      #@event_series = EventSeries.new(:frequency => params[:event][:frequency], :period => params[:event][:repeats], :starttime => params[:event][:starttime], :endtime => params[:event][:endtime], :all_day => params[:event][:all_day])
      @event_series = EventSeries.new(params[:event])
      @event_series.save
      redirect_to '/events'
    end
  end
  
  # Display calendar
  def index
    @title = "June 2010"
    @display_calendar = true
  end

  def get_all
    # University
    @events = Event.find(:all, :conditions => ["starttime >= '#{Time.at(params['start'].to_i).to_formatted_s(:db)}' and 
                                                endtime <= '#{Time.at(params['end'].to_i).to_formatted_s(:db)}' and 
                                                category = 'university'"] )
    events = [] 
    @events.each do |event|
      events << {
        :id => event.id, 
        :title => event.title, 
        :description => event.description || "Some cool description here...", 
        :start => "#{event.starttime.iso8601}", 
        :end => "#{event.endtime.iso8601}", 
        :allDay => event.all_day, 
        :recurring => (event.event_series_id)? true: false,
        :className => 'university'}
    end
    
    # Campus
    if @current_user.campus_id
      @events = Event.find(:all, :conditions => ["starttime >= '#{Time.at(params['start'].to_i).to_formatted_s(:db)}' and 
                                                  endtime <= '#{Time.at(params['end'].to_i).to_formatted_s(:db)}' and 
                                                  campus_id = '#{@current_user.campus_id}' and
                                                  category = 'campus'"] )
      @events.each do |event|
        events << {
          :id => event.id, 
          :title => event.title, 
          :description => event.description || "Some cool description here...", 
          :start => "#{event.starttime.iso8601}", 
          :end => "#{event.endtime.iso8601}", 
          :allDay => event.all_day, 
          :recurring => (event.event_series_id)? true: false,
          :className => 'campus'}
      end
    end
    
    # TODO: Classes
    if @current_user.role = 'student'
      
      
    end
    
    # Personal
    @events = Event.find(:all, :conditions => ["starttime >= '#{Time.at(params['start'].to_i).to_formatted_s(:db)}' and 
                                                  endtime <= '#{Time.at(params['end'].to_i).to_formatted_s(:db)}' and 
                                                  creator_id = #{@current_user.id} and 
                                                  category = 'personal'"] )
    @events.each do |event|
      events << {
        :id => event.id, 
        :title => event.title, 
        :description => event.description || "Some cool description here...", 
        :start => "#{event.starttime.iso8601}", 
        :end => "#{event.endtime.iso8601}", 
        :allDay => event.all_day, 
        :recurring => (event.event_series_id)? true: false,
        :className => 'perso'}
    end
    
    render :text => events.to_json
  end
  
  def move
    @event = Event.find_by_id params[:id]
    if @event
      @event.starttime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.starttime))
      @event.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.endtime))
      @event.all_day = params[:all_day]
      @event.save
    end
  end
  
  
  def resize
    @event = Event.find_by_id params[:id]
    if @event
      @event.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.endtime))
      @event.save
    end    
  end
  
  def edit
    @event = Event.find_by_id(params[:id])
  end
  
  def update
    @event = Event.find_by_id(params[:event][:id])
    if params[:event][:commit_button] == "Update All Occurrence"
      @events = @event.event_series.events #.find(:all, :conditions => ["starttime > '#{@event.starttime.to_formatted_s(:db)}' "])
      @event.update_events(@events, params[:event])
    elsif params[:event][:commit_button] == "Update All Following Occurrence"
      @events = @event.event_series.events.find(:all, :conditions => ["starttime > '#{@event.starttime.to_formatted_s(:db)}' "])
      @event.update_events(@events, params[:event])
    else
      @event.attributes = params[:event]
      @event.save
    end

    render :update do |page|
      page<<"$('#calendar').fullCalendar( 'refetchEvents' )"
      page<<"$('#desc_dialog').dialog('destroy')" 
    end
    
  end  
  
  def destroy
    @event = Event.find_by_id(params[:id])
    if params[:delete_all] == 'true'
      @event.event_series.destroy
    elsif params[:delete_all] == 'future'
      @events = @event.event_series.events.find(:all, :conditions => ["starttime > '#{@event.starttime.to_formatted_s(:db)}' "])
      @event.event_series.events.delete(@events)
    else
      @event.destroy
    end
    
    render :update do |page|
      page<<"$('#calendar').fullCalendar( 'refetchEvents' )"
      page<<"$('#desc_dialog').dialog('destroy')" 
    end
    
  end
  
  # iCal Support
  def feed
    respond_to do |format|
      if @current_user.valid?
        format.html { render :text => self.generate_ical }
      else
        format.ics { render :nothing => true, :status => :forbidden }
      end
    end
  end
  
  def generate_ical
    @events = Event.find(:all, :conditions => ["starttime >= '#{Time.at(params['start'].to_i).to_formatted_s(:db)}' and 
                                                  endtime <= '#{Time.at(params['end'].to_i).to_formatted_s(:db)}' and 
                                                  creator_id = #{@current_user.id} and 
                                                  category = 'personal'"])
    
    cal = Icalendar::Calendar.new
    cal.custom_property("METHOD","PUBLISH")
    @events.each do |e|
      event = Icalendar::Event.new
      event.start = e.start.strftime("%Y%m%dT%H%M%S")
      event.end = e.end.strftime("%Y%m%dT%H%M%S")
      event.summary = e.summary
      event.description = e.summary
      event.url = "http://yourwebsite.com"
      event.add_comment("More info at http://yourwebsite.com")
      cal.add event
    end
    headers['Content-Type'] = "text/calendar; charset=UTF-8"
    cal.publish
    cal.to_ical
  end
  
end














