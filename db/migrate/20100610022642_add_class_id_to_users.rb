class AddClassIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :class_id, :integer
     add_index :users, :class_id
  end

  def self.down
    remove_column :users, :class_id
  end
end
