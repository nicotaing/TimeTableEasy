class AddClasseIdToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :classe_id, :integer
  end

  def self.down
    remove_column :events, :classe_id
  end
end
