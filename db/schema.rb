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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140707050433) do

  create_table "resumes", force: true do |t|
    t.integer  "student_account_id",                null: false
    t.string   "file_name",                         null: false
    t.boolean  "is_active",          default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resumes", ["student_account_id"], name: "index_on_student_account_id", using: :btree

  create_table "student_accounts", force: true do |t|
    t.string   "first_name",                        null: false
    t.string   "last_name",                         null: false
    t.string   "middle_name"
    t.string   "email",                             null: false
    t.boolean  "verified",          default: false, null: false
    t.integer  "school",                            null: false
    t.integer  "graduation_year"
    t.integer  "current_resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_accounts", ["email"], name: "index_on_email", using: :btree
  add_index "student_accounts", ["last_name", "first_name"], name: "index_on_last_and_first_name", using: :btree
  add_index "student_accounts", ["school"], name: "index_on_school", using: :btree

end
