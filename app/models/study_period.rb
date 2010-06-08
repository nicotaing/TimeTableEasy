# == Schema Information
# Schema version: 20100608022458
#
# Table name: study_periods
#
#  id         :integer         not null, primary key
#  startdate  :datetime
#  enddate    :datetime
#  created_at :datetime
#  updated_at :datetime
#  cursus_id  :integer
#

class StudyPeriod < ActiveRecord::Base
  attr_accessible :startdate, :enddate, :cursus_id
  
  has_many :courses, :dependent => :destroy
  belongs_to :cursus
end
