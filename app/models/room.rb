# == Schema Information
# Schema version: 20100421114236
#
# Table name: rooms
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  campus_id  :integer(4)
#

class Room < ActiveRecord::Base
  attr_accessible :name
  
  has_many :events
  belongs_to :campus
end
