class AddClasseIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :classe_id, :integer
    add_index  :users, :classe_id
  end

  def self.down
    remove_column :users, :classe_id
  end
end
