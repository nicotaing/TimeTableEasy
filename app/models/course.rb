# == Schema Information
# Schema version: 20100421114236
#
# Table name: courses
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  volume          :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#  study_period_id :integer(4)
#  modality_id     :integer(4)
#

class Course < ActiveRecord::Base
  attr_accessible :name, :volume
  
  has_many :events, :dependent => :destroy
  belongs_to :study_period
end
