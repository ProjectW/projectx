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

ActiveRecord::Schema.define(version: 20140720052918) do

  create_table "companies", force: true do |t|
    t.string   "name",         null: false
    t.string   "display_name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_accounts", force: true do |t|
    t.integer  "company_id",    null: false
    t.string   "contact_name"
    t.string   "contact_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resumes", force: true do |t|
    t.integer  "student_account_id",                 null: false
    t.boolean  "active",              default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

  add_index "resumes", ["student_account_id"], name: "index_on_student_account_id", using: :btree

  create_table "student_accounts", force: true do |t|
    t.integer  "school",                                null: false
    t.integer  "graduation_year"
    t.integer  "current_resume_id"
    t.boolean  "active",                 default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "full_name",                             null: false
    t.string   "unconfirmed_email",      default: "",   null: false
  end

  add_index "student_accounts", ["full_name"], name: "index_on_full_name", using: :btree
  add_index "student_accounts", ["school", "email"], name: "index_on_school_and_email", using: :btree

end
