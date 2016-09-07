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

ActiveRecord::Schema.define(version: 20160905104417) do

  create_table "health_insurance_plans", primary_key: "insurance_plan_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "insurance_id",                                   null: false
    t.string   "name",                                           null: false
    t.text     "description",      limit: 65535
    t.float    "cover_percentage", limit: 24,    default: 0.0,   null: false
    t.boolean  "voided",                         default: false, null: false
    t.string   "void_reason"
    t.integer  "creator",                                        null: false
    t.integer  "changed_by"
    t.datetime "date_created"
    t.datetime "date_changed"
  end

  create_table "health_insurances", primary_key: "insurance_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                       null: false
    t.text     "description",  limit: 65535
    t.boolean  "voided",                     default: false, null: false
    t.string   "void_reason"
    t.integer  "creator",                                    null: false
    t.integer  "changed_by"
    t.datetime "date_created"
    t.datetime "date_changed"
  end

  create_table "user_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "role"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.integer  "user_role_id"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
