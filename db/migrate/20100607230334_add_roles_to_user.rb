class AddRolesToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :string
    add_column :users, :campus_id, :integer
    add_index :users, :campus_id, :integer 
  end

  def self.down
    remove_column :users, :campus_id
  end
end
