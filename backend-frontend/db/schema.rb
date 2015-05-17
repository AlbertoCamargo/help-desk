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

ActiveRecord::Schema.define(version: 10) do

  create_table "comments_incidents", force: :cascade do |t|
    t.text     "description", null: false
    t.integer  "user_id",     null: false
    t.integer  "incident_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments_incidents", ["incident_id"], name: "index_comments_incidents_on_incident_id"
  add_index "comments_incidents", ["user_id"], name: "index_comments_incidents_on_user_id"

  create_table "comments_problems", force: :cascade do |t|
    t.text     "description", null: false
    t.integer  "user_id",     null: false
    t.integer  "problem_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments_problems", ["problem_id"], name: "index_comments_problems_on_problem_id"
  add_index "comments_problems", ["user_id"], name: "index_comments_problems_on_user_id"

  create_table "comments_requests", force: :cascade do |t|
    t.text     "description", null: false
    t.integer  "user_id",     null: false
    t.integer  "request_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments_requests", ["request_id"], name: "index_comments_requests_on_request_id"
  add_index "comments_requests", ["user_id"], name: "index_comments_requests_on_user_id"

  create_table "incidents", force: :cascade do |t|
    t.string   "title",                              null: false
    t.text     "description",                        null: false
    t.string   "file"
    t.string   "state",       default: "unanswered"
    t.integer  "user_id",                            null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "incidents", ["user_id"], name: "index_incidents_on_user_id"

  create_table "problems", force: :cascade do |t|
    t.string   "title",                              null: false
    t.text     "description",                        null: false
    t.string   "file"
    t.string   "state",       default: "unanswered"
    t.integer  "user_id",                            null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "problems", ["user_id"], name: "index_problems_on_user_id"

  create_table "requests", force: :cascade do |t|
    t.string   "title",                              null: false
    t.text     "description",                        null: false
    t.string   "file"
    t.string   "state",       default: "unanswered"
    t.integer  "user_id",                            null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "requests", ["user_id"], name: "index_requests_on_user_id"

  create_table "users", force: :cascade do |t|
    t.integer  "customer_id",                                    null: false
    t.string   "full_name",                                      null: false
    t.string   "email"
<<<<<<< HEAD
    t.integer  "phone"
=======
    t.string   "phone"
>>>>>>> ebbe5097cff5490c4afc79467063249142304269
    t.string   "image"
    t.string   "rank",                                           null: false
    t.boolean  "first_time",                      default: true
    t.string   "crypted_password",                               null: false
    t.string   "salt",                                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["customer_id"], name: "index_users_on_customer_id", unique: true
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

end
