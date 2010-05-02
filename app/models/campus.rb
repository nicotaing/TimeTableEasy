# == Schema Information
# Schema version: 20100421114236
#
# Table name: campus
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  city       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Campus < ActiveRecord::Base
  attr_accessible :name, :city
  
  has_many :rooms, :dependent => :destroy
end
