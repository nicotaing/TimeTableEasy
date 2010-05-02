class CreateModalities < ActiveRecord::Migration
  def self.up
    create_table :modalities do |t|
      t.string :name
      t.boolean :is_exam

      t.timestamps
    end
  end

  def self.down
    drop_table :modalities
  end
end
