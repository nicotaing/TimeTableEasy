class CreateModas < ActiveRecord::Migration
  def self.up
    create_table :modas do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :modas
  end
end
