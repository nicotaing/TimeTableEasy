class AddCategoryToEventSeries < ActiveRecord::Migration
  def self.up
    add_column :event_series, :category, :string
    add_column :event_series, :creator_id, :id
    add_column :event_series, :campus_id, :integer
  end

  def self.down
    remove_column :event_series, :category
    remove_column :event_series, :creator_id
    remove_column :event_series, :campus_id
  end
end
