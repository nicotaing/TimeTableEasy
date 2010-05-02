class AddModalityToCourse < ActiveRecord::Migration
  def self.up
    add_column :courses, :modality_id, :integer
    add_index :courses, :modality_id
  end

  def self.down
    remove_column :courses, :modality_id
  end
end
