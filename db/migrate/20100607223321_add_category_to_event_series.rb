class AddCategoryToEventSeries < ActiveRecord::Migration
  def self.up
    add_column :event_series, :category, :string
    add_column :event_series, :creator_id, :id
    add_column :event_series, :campus_id, :integer
    add_column :event_series, :location, :string
    add_column :event_series, :professor_id, :string
  end

  def self.down
    remove_column :event_series, :category
    remove_column :event_series, :creator_id
    remove_column :event_series, :campus_id
    remove_column :event_series, :location
  end
end
