class CreateModa < ActiveRecord::Migration
  def self.up
    create_table :modas do |t|
      t.integer :course_id
      t.integer :modality_id
      t.integer :volume
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
