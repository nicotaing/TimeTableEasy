# == Schema Information
# Schema version: 20100516033807
#
# Table name: rooms
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  campus_id  :integer
#

class Room < ActiveRecord::Base
  attr_accessible :name
  
  has_many :events
  belongs_to :campus
end
