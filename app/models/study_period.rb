# == Schema Information
# Schema version: 20100610022642
#
# Table name: study_periods
#
#  id         :integer         not null, primary key
#  startdate  :date
#  enddate    :date
#  created_at :datetime
#  updated_at :datetime
#  cursus_id  :integer
#  name       :string(255)
#

class StudyPeriod < ActiveRecord::Base
  attr_accessible :name, :startdate, :enddate, :cursus_id
  
  has_many :classes, :dependent => :destroy
  has_many :courses, :dependent => :destroy
  belongs_to :cursus
end
