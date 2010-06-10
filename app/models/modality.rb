# == Schema Information
# Schema version: 20100610093702
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
  has_many :modalities
end
