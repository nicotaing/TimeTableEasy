class EventsController < ApplicationController
  
  before_filter :require_user
  
  def new
    @title = "Create Event"
    @event = Event.new(:endtime => 1.hour.from_now, :period => "Does not repeat")
    
    if params[:id] == "university" && @current_user.role == 'admin'
      @tab_university = 'active'
      render :new_university
      
    elsif params[:id] == "campus" && (@current_user.role == 'admin' || @current_user.role == 'cm')
      @campus = Campus.all
      @tab_campus = 'active'   
      render :new_campus
      
    elsif params[:id] == "class" && (@current_user.role == 'admin' || @current_user.role == 'cm')
      @tab_class = 'active'      
      render :new_class
      
    else              
      @tab_personal = 'active'
      render :new_personal
    end
    
  end
  
  def create
    @event = Event.new(params[:event])
    @event.creator_id = @current_user.id
      
    if params[:event][:all_day] == "false" 
      @event.endtime = @event.starttime + params[:event][:endtime].to_i.hours
    end

    respond_to do |format| 
      if @event.save
        format.html { redirect_to("/events", :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        if params[:event][:category] == "university" 
          @tab_university = 'active'
        elsif params[:event][:category] == "campus" 
          @tab_campus = 'active'   
        elsif params[:event][:category] == "class"
          @tab_class = 'active'      
        else              
          @tab_personal = 'active'
        end
        format.html { render :action => "new_#{params[:event][:category]}" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
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
        :className => 'university',
        :url => "/events/edit/#{event.id}"}
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
          :className => 'campus',
          :url => "/events/edit/#{event.id}"}
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
        :className => 'perso',
        :url => "/events/edit/#{event.id}"}
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
    @diff_sec = @event.diff_between(@event.starttime, @event.endtime)
    @diff_hours = @diff_sec / 1.hours
    @options = []
    @title = "Event Details"
    
    (1..10).each do |i|
      if i == @diff_hours
        @options<< "<option selected=selected value=\"#{i}\">#{i}</option>"
      else
        @options<< "<option value=\"#{i}\">#{i}</option>"
      end
    end
    
    if @event.category == "university" && @current_user.role == 'admin'
      render :edit_university, :layout => 'popup'
      
    elsif  @event.category == "campus" && (@current_user.role == 'admin' || @current_user.role == 'cm')  && (@event.campus_id == @current_user.campus_id)
      render :edit_campus, :layout => 'popup'
      
    elsif @event.category  == "class" && (@current_user.role == 'admin' || @current_user.role == 'cm')     
      render :edit_class, :layout => 'popup'
      
    elsif @event.category == "personal" && (@current_user.id == @event.creator_id)              
      render :edit_personal, :layout => 'popup'
    else
      render :edit_norights, :layout => 'popup'
    end
    
  end
  
  def nothing
  end
  
  def update
    @event = Event.find_by_id(params[:event][:id])
    
    if params[:event][:category] != "class"
      
      if params[:event][:all_day] == "false" 
        endtime = @event.starttime + params[:event][:endtime].to_i.hours
      end

    end
    
    params[:event][:endtime] = endtime
    @event.attributes = params[:event]
    @event.save

    redirect_to root_path
    
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














