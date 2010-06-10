class AddCourseIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :course_id, :integer
  end

  def self.down
    remove_column :users, :course_id
  end
end
