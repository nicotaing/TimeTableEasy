class AddModaIdToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :moda_id, :integer
  end

  def self.down
    remove_column :events, :moda_id
  end
end
