# == Schema Information
# Schema version: 20100610022642
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
  
  has_many :classes, :dependent => :destroy
  has_many :rooms, :dependent => :destroy
  
  def cursus_with_classes
    
  end
  
  def classes
    Classe.find_all_by_campus_id(self.id)
  end
  
  def classes_with_study_period_id(id)
    Classe.all(:conditions => ["campus_id = ? AND study_period_id = ?", self.id, id] )
  end
  
  def study_periods
    study_periods = []
    self.classes.each do |classe|
      s = StudyPeriod.find(classe.study_period_id)
      study_periods << s unless study_periods.include?(s)
    end
    study_periods
  end
  
  def cursuses
    cursuses = []
    self.study_periods.each do |study_period|
      cursus = Cursus.find(study_period.cursus_id)
      cursuses << cursus unless cursuses.include?(cursus)
    end
    cursuses
  end
  
end
