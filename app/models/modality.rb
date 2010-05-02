# == Schema Information
# Schema version: 20100421114236
#
# Table name: modalities
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  is_exam    :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#

class Modality < ActiveRecord::Base
  has_many :courses, :dependent => :destroy
end
