class AddStudyPeriodToCourse < ActiveRecord::Migration
  def self.up
    add_column :courses, :study_period_id , :integer
    add_index :courses, :study_period_id
  end

  def self.down
    remove_column :courses, :study_period
  end
end
