class AddRoomsToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :room_id, :integer
    add_index :events, :room_id
  end

  def self.down
    remove_column :events, :rooms_id
  end
end
