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

ActiveRecord::Schema.define(:version => 20090921082632) do

  create_table "answers", :force => true do |t|
    t.integer  "teacher_answer_id"
    t.integer  "question_id"
    t.string   "value"
    t.integer  "position"
    t.float    "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exams", :force => true do |t|
    t.integer  "student_id"
    t.integer  "teacher_exam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.datetime "started_at"
  end

  create_table "mass_exams", :force => true do |t|
    t.integer  "teacher_id"
    t.integer  "teacher_exam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "teacher_question_id"
    t.integer  "exam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "state"
  end

  create_table "student_imports", :force => true do |t|
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "teacher_answers", :force => true do |t|
    t.integer  "teacher_question_id"
    t.text     "content"
    t.float    "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teacher_exams", :force => true do |t|
    t.integer  "teacher_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_number"
    t.datetime "start_date"
    t.integer  "duration"
  end

  create_table "teacher_exams_teacher_questions", :id => false, :force => true do |t|
    t.integer "teacher_exam_id"
    t.integer "teacher_question_id"
  end

  create_table "teacher_questions", :force => true do |t|
    t.text     "content"
    t.string   "question_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teacher_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.string   "last_login_ip"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

end
