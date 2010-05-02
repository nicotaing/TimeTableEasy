class CreateCursus < ActiveRecord::Migration
  def self.up
    create_table :cursus do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :cursus
  end
end
