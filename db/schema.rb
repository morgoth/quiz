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

ActiveRecord::Schema.define(:version => 20090624181644) do

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
  end

  create_table "questions", :force => true do |t|
    t.integer  "teacher_question_id"
    t.integer  "exam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
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
  end

end
