class AddCategoryToEventSeries < ActiveRecord::Migration
  def self.up
    add_column :event_series, :category, :string
    add_column :event_series, :creator_id, :id
  end

  def self.down
    remove_column :event_series, :category
    remove_column :event_series, :creator_id
  end
end
