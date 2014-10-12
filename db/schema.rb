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

ActiveRecord::Schema.define(version: 20141002003058) do

  create_table "cities", force: true do |t|
    t.string  "name",                  null: false
    t.string  "state",      limit: 2
    t.integer "country_id",            null: false
    t.float   "latitude",   limit: 24
    t.float   "longitude",  limit: 24
  end

  add_index "cities", ["country_id"], name: "index_on_country_id", using: :btree
  add_index "cities", ["state"], name: "index_on_state", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name",         default: "", null: false
    t.string   "display_name", default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  add_index "companies", ["name"], name: "index_on_name", unique: true, using: :btree

  create_table "company_accounts", force: true do |t|
    t.integer  "company_id",    null: false
    t.string   "contact_name"
    t.string   "contact_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_profile_views", force: true do |t|
    t.integer  "company_id",         null: false
    t.integer  "student_account_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_profile_views", ["company_id", "student_account_id"], name: "index_on_company_student_account_id", using: :btree

  create_table "company_search_terms", force: true do |t|
    t.integer  "student_account_id", null: false
    t.string   "term",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string "name",                   null: false
    t.string "maxmind_code", limit: 2
  end

  create_table "interested_roles", force: true do |t|
    t.integer  "student_attribute_list_id", null: false
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interested_roles", ["role"], name: "index_on_role", using: :btree
  add_index "interested_roles", ["student_attribute_list_id"], name: "index_on_student_attribute_list_id", using: :btree

  create_table "resumes", force: true do |t|
    t.integer  "student_account_id",                  null: false
    t.boolean  "deleted",             default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
  end

  add_index "resumes", ["student_account_id"], name: "index_on_student_account_id", using: :btree

  create_table "reviews", force: true do |t|
    t.string   "position_title",                     null: false
    t.integer  "number_interns",     default: 0
    t.integer  "year",               default: 0,     null: false
    t.integer  "salary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "projects"
    t.text     "mentorship"
    t.integer  "student_account_id",                 null: false
    t.integer  "company_id"
    t.boolean  "contactable",        default: false, null: false
    t.integer  "season",                             null: false
    t.integer  "number_hours"
    t.boolean  "recommend",                          null: false
    t.text     "story"
    t.text     "culture"
    t.text     "extra"
    t.string   "location"
  end

  add_index "reviews", ["company_id", "student_account_id"], name: "index_on_company_id_and_student_account_id", using: :btree

  create_table "schools", force: true do |t|
    t.string   "name",         default: "", null: false
    t.string   "display_name", default: "", null: false
    t.integer  "degree_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["name"], name: "index_on_name", unique: true, using: :btree

  create_table "student_accounts", force: true do |t|
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.string   "middle_name"
    t.integer  "school_id",                              null: false
    t.integer  "graduation_year",                        null: false
    t.integer  "current_resume_id"
    t.boolean  "deleted",                default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
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
    t.string   "unconfirmed_email",      default: "",    null: false
  end

  add_index "student_accounts", ["email"], name: "index_on_email", using: :btree
  add_index "student_accounts", ["last_name", "first_name"], name: "index_on_last_and_first_name", using: :btree
  add_index "student_accounts", ["school_id"], name: "index_on_school_id", using: :btree

  create_table "student_attribute_lists", force: true do |t|
    t.integer  "student_account_id", null: false
    t.string   "github_url"
    t.string   "website_url"
    t.integer  "technical_level"
    t.integer  "major"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
