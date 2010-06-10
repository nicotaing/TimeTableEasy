class CreateStudyPeriods < ActiveRecord::Migration
  def self.up
    create_table :study_periods do |t|
      t.date :startdate
      t.date :enddate

      t.timestamps
    end
  end

  def self.down
    drop_table :study_periods
  end
end
