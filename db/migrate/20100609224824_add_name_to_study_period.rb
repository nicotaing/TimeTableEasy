class AddNameToStudyPeriod < ActiveRecord::Migration
  def self.up
    add_column :study_periods, :name, :string
  end

  def self.down
    remove_column :study_periods, :name
  end
end
