# == Schema Information
#
# Table name: events
#
#  id              :integer         not null, primary key
#  title           :string(255)
#  starttime       :datetime
#  endtime         :datetime
#  all_day         :boolean         default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#  description     :text
#  event_series_id :integer
#  room_id         :integer
#  course_id       :integer
#  creator_id      :integer
#  campus_id       :integer
#  category        :string(255)
#  location        :string(255)
#  modality_id     :string(255)
#  professor_id    :string(255)
#

class Event < ActiveRecord::Base
  attr_accessor :period, :frequency, :commit_button
  
  validates_presence_of :title
  
  belongs_to :event_series
  belongs_to :room
  belongs_to :course
  
  # TODO: ne le faire que si c'est un cours, pas quand c'est un event personnel
  #before_save :check_volume
  
  REPEATS = [
              "Does not repeat",
              "Daily"          ,
              "Weekly"         ,
              "Monthly"        ,
              "Yearly"         
  ]
  
  def validate
    if !all_day and (starttime >= endtime)
      errors.add_to_base("Start Time must be less than End Time")
    end
  end
  
  def update_events(events, event)
    events.each do |e|
      begin 
        st, et = e.starttime, e.endtime
        e.attributes = event
        if event_series.period.downcase == 'monthly' or event_series.period.downcase == 'yearly'
          nst = DateTime.parse("#{e.starttime.hour}:#{e.starttime.min}:#{e.starttime.sec}, #{e.starttime.day}-#{st.month}-#{st.year}")  
          net = DateTime.parse("#{e.endtime.hour}:#{e.endtime.min}:#{e.endtime.sec}, #{e.endtime.day}-#{et.month}-#{et.year}")
        else
          nst = DateTime.parse("#{e.starttime.hour}:#{e.starttime.min}:#{e.starttime.sec}, #{st.day}-#{st.month}-#{st.year}")  
          net = DateTime.parse("#{e.endtime.hour}:#{e.endtime.min}:#{e.endtime.sec}, #{et.day}-#{et.month}-#{et.year}")
        end
        #puts "#{nst}           :::::::::          #{net}"
      rescue
        nst = net = nil
      end
      if nst and net
        #          e.attributes = event
        e.starttime, e.endtime = nst, net
        e.save
      end
    end
    
    event_series.attributes = event
    event_series.save
  end
  
  ###To Do: afficher les erreurs pour indiquer qu'il
  def check_volume
    volume_wished = self.diff_between(self.starttime, self.endtime) 
    currently_volume = self.has_currently
    limit = self.course.volume
    
    limit >= volume_wished + currently_volume
  end
  
  def has_currently
    events = Event.find_by_sql ["SELECT id, title, starttime, endtime, 
      course_id 
    FROM events 
    WHERE course_id = ? 
    AND endtime BETWEEN ? AND ?", self.course_id, self.course.study_period.startdate, self.course.study_period.enddate]
    
    res=[]
    events.each do |e|
      res << diff_between(e.starttime, e.endtime)
    end
    
    res.sum
  end
  
  
  def diff_between(starttime, endtime)
    endtime - starttime
  end
  
  def diff
    self.endtime - self.starttime
  end
  
end

