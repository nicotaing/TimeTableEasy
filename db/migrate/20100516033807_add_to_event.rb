class AddToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :creator_id, :integer
    add_column :events, :campus_id, :integer
    add_column :events, :category, :string
    add_column :events, :location, :string
    add_column :events, :modality_id, :string
    add_column :events, :professor_id, :string
  end

  def self.down
    remove_column :events, :creator_id
    remove_column :events, :campus_id
    remove_column :events, :category
    remove_column :events, :location
    remove_column :events, :modality_id
  end
end
