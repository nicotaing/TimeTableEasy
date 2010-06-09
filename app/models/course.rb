# == Schema Information
# Schema version: 20100608022458
#
# Table name: courses
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  volume          :integer
#  created_at      :datetime
#  updated_at      :datetime
#  study_period_id :integer
#  modality_id     :integer
#

class Course < ActiveRecord::Base
  attr_accessible :name, :volume, :study_period_id, :modality_id
  
  has_many :events, :dependent => :destroy
  belongs_to :study_period
  
  cattr_reader :per_page
  @@per_page = 10
  
  
  
  def has_currently
    events = Event.find_by_sql ["SELECT id, title, starttime, endtime, 
      course_id 
    FROM events 
    WHERE course_id = ? 
    AND endtime BETWEEN ? AND ?", self.id, self.study_period.startdate, self.study_period.enddate]
    
    res=[]
    events.each do |e|
      res << diff_between(e.starttime, e.endtime)
    end
    
    res.sum
  end
  
end
