class Classe < ActiveRecord::Base
  belongs_to :campus
  belongs_to :study_period
  has_many :students
end
