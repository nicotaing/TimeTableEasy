class AddToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :creator_id, :integer
    add_column :events, :campus_id, :integer
    add_column :events, :category, :string
  end

  def self.down
    remove_column :events, :creator_id
    remove_column :events, :category
  end
end
