class AddCampusToRooms < ActiveRecord::Migration
  def self.up
    add_column :rooms, :campus_id, :integer
    add_index :rooms, :campus_id
  end

  def self.down
  end
end
