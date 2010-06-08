# == Schema Information
# Schema version: 20100608022458
#
# Table name: modalities
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  is_exam    :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Modality < ActiveRecord::Base
  has_many :courses, :dependent => :destroy
end
