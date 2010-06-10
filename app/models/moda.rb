# == Schema Information
# Schema version: 20100610093702
#
# Table name: modas
#
#  id          :integer         not null, primary key
#  course_id   :integer
#  modality_id :integer
#  volume      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Moda < ActiveRecord::Base
  belongs_to :course
  belongs_to :modality
  
  
  validates_numericality_of :volume
  
end
