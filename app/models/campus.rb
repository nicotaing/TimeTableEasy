# == Schema Information
# Schema version: 20100608022458
#
# Table name: campus
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  city       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Campus < ActiveRecord::Base
  attr_accessible :name, :city
  
  has_many :rooms, :dependent => :destroy
end
