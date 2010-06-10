# == Schema Information
# Schema version: 20100610093702
#
# Table name: classes
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  campus_id       :integer
#  study_period_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Classe < ActiveRecord::Base
  belongs_to :campus
  belongs_to :study_period
  has_many :users
end
