class AddCourseToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :course_id , :integer
    add_index :events, :course_id
  end

  def self.down
    remove_column :events, :course_id
  end
end
