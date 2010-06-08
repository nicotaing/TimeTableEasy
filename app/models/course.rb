# == Schema Information
# Schema version: 20100516033807
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
  
end
