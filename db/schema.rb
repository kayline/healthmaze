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

ActiveRecord::Schema.define(version: 20131128003741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cares", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cares_plans", force: true do |t|
    t.integer  "cover_percent"
    t.boolean  "covered"
    t.boolean  "limited_visits", default: false
    t.integer  "visits"
    t.integer  "plan_id"
    t.integer  "care_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "needs", force: true do |t|
    t.string   "description"
    t.integer  "frequency"
    t.integer  "care_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.decimal  "cost"
  end

  create_table "plans", force: true do |t|
    t.string   "title"
    t.string   "provider"
    t.string   "category"
    t.decimal  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "deductible"
    t.decimal  "annual_limit"
  end

  create_table "plans_users", force: true do |t|
    t.decimal "total_cost", default: 0.0
    t.integer "user_id"
    t.integer "plan_id"
    t.decimal "care_costs", default: 0.0
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
