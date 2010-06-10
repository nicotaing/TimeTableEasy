# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100609224824) do

  create_table "campus", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classes", :force => true do |t|
    t.string   "name"
    t.integer  "campus_id"
    t.integer  "study_period_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.integer  "volume"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "study_period_id"
    t.integer  "modality_id"
  end

  add_index "courses", ["modality_id"], :name => "index_courses_on_modality_id"
  add_index "courses", ["study_period_id"], :name => "index_courses_on_study_period_id"

  create_table "cursus", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "event_series" because of following StandardError
#   Unknown type 'id' for column 'creator_id'

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "event_series_id"
    t.integer  "room_id"
    t.integer  "course_id"
    t.integer  "creator_id"
    t.integer  "campus_id"
    t.string   "category"
    t.string   "location"
    t.string   "modality_id"
    t.string   "professor_id"
  end

  add_index "events", ["course_id"], :name => "index_events_on_course_id"
  add_index "events", ["event_series_id"], :name => "index_events_on_event_series_id"
  add_index "events", ["room_id"], :name => "index_events_on_room_id"

  create_table "modalities", :force => true do |t|
    t.string   "name"
    t.boolean  "is_exam"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "campus_id"
  end

  add_index "rooms", ["campus_id"], :name => "index_rooms_on_campus_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "study_periods", :force => true do |t|
    t.date     "startdate"
    t.date     "enddate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cursus_id"
    t.string   "name"
  end

  add_index "study_periods", ["cursus_id"], :name => "index_study_periods_on_cursus_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.integer  "campus_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
