# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120220180832) do

  create_table "activitylogs", :force => true do |t|
    t.string   "user"
    t.string   "activity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "userid"
  end

  create_table "administrator_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "administrators", :force => true do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assestmentlists", :force => true do |t|
    t.integer  "student_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sy"
  end

  create_table "cashier_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cashiers", :force => true do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "staffnum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "fname"
    t.text     "mname"
    t.text     "lname"
    t.string   "address"
    t.string   "email"
    t.integer  "telnum"
    t.integer  "celnum"
    t.text     "suffix"
  end

  create_table "constants", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", :force => true do |t|
    t.integer  "first_quarter"
    t.integer  "second_quarter"
    t.integer  "third_quarter"
    t.integer  "fourth_quarter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fourth_quarter_quiz"
    t.integer  "fourth_quarter_seatwork"
    t.integer  "fourth_quarter_project"
    t.integer  "fourth_quarter_assignment"
    t.integer  "fourth_quarter_exam"
    t.integer  "fourth_quarter_attendance"
    t.integer  "fourth_quarter_recitation"
    t.integer  "third_quarter_quiz"
    t.integer  "third_quarter_seatwork"
    t.integer  "third_quarter_project"
    t.integer  "third_quarter_assignment"
    t.integer  "third_quarter_exam"
    t.integer  "third_quarter_attendance"
    t.integer  "third_quarter_recitation"
    t.integer  "second_quarter_quiz"
    t.integer  "second_quarter_seatwork"
    t.integer  "second_quarter_project"
    t.integer  "second_quarter_assignment"
    t.integer  "second_quarter_exam"
    t.integer  "second_quarter_attendance"
    t.integer  "second_quarter_recitation"
    t.integer  "first_quarter_quiz"
    t.integer  "first_quarter_seatwork"
    t.integer  "first_quarter_project"
    t.integer  "first_quarter_assignment"
    t.integer  "first_quarter_exam"
    t.integer  "first_quarter_attendance"
    t.integer  "first_quarter_recitation"
  end

  create_table "masterlists", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "transaction_id"
    t.string   "sy"
    t.integer  "student_id"
    t.integer  "subject_id"
    t.integer  "grade_id"
  end

  create_table "miscellaneous", :force => true do |t|
    t.text     "name"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "miscs", :force => true do |t|
    t.string   "name"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.string   "transaction_id"
    t.integer  "amount"
    t.string   "sy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cashier_id"
  end

  create_table "reciepts", :force => true do |t|
    t.integer  "transaction_id"
    t.integer  "cashier_id"
    t.integer  "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "studinfo_id"
  end

  create_table "studinfos", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "studnum"
    t.string   "email"
    t.text     "mname"
    t.string   "address"
    t.string   "level"
    t.text     "suffix"
  end

  create_table "subjects", :force => true do |t|
    t.string   "schdcode"
    t.string   "subjcode"
    t.text     "days"
    t.integer  "time1"
    t.integer  "time2"
    t.integer  "room"
    t.integer  "amount"
    t.string   "block"
    t.string   "tname"
    t.integer  "staffnum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "level"
    t.string   "description"
    t.integer  "teacher_id"
    t.integer  "quiz"
    t.integer  "seatwork"
    t.integer  "exam"
    t.integer  "project"
    t.integer  "assignment"
    t.integer  "attendance"
    t.integer  "recitation"
    t.string   "type"
  end

  create_table "teacher_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "staffnum"
    t.text     "fname"
    t.text     "minitial"
    t.text     "lname"
    t.string   "level"
    t.string   "address"
    t.integer  "telnum"
    t.integer  "cellnum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.text     "suffix"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "student_id"
    t.string   "sy"
    t.integer  "subjectamount"
    t.integer  "miscamount"
    t.integer  "paidamount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "discount"
  end

end
