# == Schema Information
#
# Table name: event_series
#
#  id           :integer         not null, primary key
#  frequency    :integer         default(1)
#  period       :string(255)     default("monthly")
#  starttime    :datetime
#  endtime      :datetime
#  all_day      :boolean         default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#  category     :string(255)
#  creator_id   :
#  campus_id    :integer
#  location     :string(255)
#  professor_id :string(255)
#

class EventSeries < ActiveRecord::Base
  attr_accessor :title, :description, :commit_button
  
  validates_presence_of :frequency, :period, :starttime, :endtime
  validates_presence_of :title, :description
  
  has_many :events, :dependent => :destroy
  
  def after_create
    create_events_until(END_TIME)
  end
  
  def create_events_until(end_time)
    st = starttime
    et = endtime
    p = r_period(period)
    nst, net = st, et
    
    while frequency.send(p).from_now(st) <= end_time
#      puts "#{nst}           :::::::::          #{net}" if nst and net
      self.events.create(:title => title, :description => description, :all_day => all_day, :starttime => nst, :endtime => net, :creator_id => @current_user.id)
      nst = st = frequency.send(p).from_now(st)
      net = et = frequency.send(p).from_now(et)
      
      if period.downcase == 'monthly' or period.downcase == 'yearly'
        begin 
          nst = DateTime.parse("#{starttime.hour}:#{starttime.min}:#{starttime.sec}, #{starttime.day}-#{st.month}-#{st.year}")  
          net = DateTime.parse("#{endtime.hour}:#{endtime.min}:#{endtime.sec}, #{endtime.day}-#{et.month}-#{et.year}")
        rescue
          nst = net = nil
        end
      end
    end
  end
  
  def r_period(period)
    case period
      when 'Daily'
      p = 'days'
      when "Weekly"
      p = 'weeks'
      when "Monthly"
      p = 'months'
      when "Yearly"
      p = 'years'
    end
    return p
  end
  
end



