# == Schema Information
# Schema version: 20100608022458
#
# Table name: cursus
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Cursus < ActiveRecord::Base
  attr_accessible :name
  has_many :study_periods, :dependent => :destroy
end
