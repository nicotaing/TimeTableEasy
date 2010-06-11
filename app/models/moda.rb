# == Schema Information
# Schema version: 20100610093702
#
# Table name: modas
#
#  id          :integer         not null, primary key
#  course_id   :integer
#  modality_id :integer
#  volume      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Moda < ActiveRecord::Base
  belongs_to :course
  belongs_to :modality
  
  validates_numericality_of :volume
  
  def remaining
    hours_planned = 0
    @events = Event.find(:all, :conditions => ["moda_id = #{self.id}"])
    @events.each do |event|
      hours_planned = ((event.starttime - event.endtime)/24/60).to_i + hours_planned
    end
    self.volume - hours_planned
    1
  end
  
end
