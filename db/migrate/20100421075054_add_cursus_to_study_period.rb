class AddCursusToStudyPeriod < ActiveRecord::Migration
  def self.up
    add_column :study_periods, :cursus_id, :integer
    add_index :study_periods, :cursus_id
  end

  def self.down
    remove_column :study_periods, :cursus_id
  end
end
