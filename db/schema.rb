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

ActiveRecord::Schema.define(version: 2021_04_02_111426) do

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "career_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "certification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.integer "gender"
    t.string "disability"
    t.string "like"
    t.string "bad"
    t.string "image"
    t.string "area"
    t.text "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nursing_home_id"
  end

  create_table "heros", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.string "last_name_kana", default: "", null: false
    t.string "address"
    t.integer "gender"
    t.string "special_skill"
    t.date "birthday"
    t.string "eto"
    t.integer "performance"
    t.text "profile"
    t.decimal "evaluation", precision: 10
    t.integer "money"
    t.integer "pool_money"
    t.integer "point"
    t.string "like"
    t.integer "initial_training"
    t.integer "practical_training"
    t.integer "social_worker"
    t.integer "care_manager"
    t.integer "care_worker"
    t.integer "mhwp"
    t.integer "csdw"
    t.integer "interventional_services"
    t.integer "whec"
    t.integer "dementia_care"
    t.integer "confirmation"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "behavior"
    t.float "smile"
    t.float "cleanliness"
    t.float "politeness"
    t.float "physical"
    t.text "initial_training_file"
    t.text "practical_training_file"
    t.text "social_worker_file"
    t.text "care_manager_filename"
    t.text "care_worker_file"
    t.text "mhwp_file"
    t.text "csdw_file"
    t.text "interventional_services_file"
    t.text "whec_file"
    t.text "dementia_care_file"
    t.text "confirmation_file"
    t.string "image"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_heros_on_email", unique: true
    t.index ["reset_password_token"], name: "index_heros_on_reset_password_token", unique: true
  end

  create_table "job_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.text "service"
    t.text "expect"
    t.integer "nursing_home_id"
    t.integer "client_id"
    t.integer "job_category_id"
    t.datetime "start_datetime"
    t.float "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "progress"
    t.integer "hero_id"
    t.string "area"
    t.string "image"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "message"
    t.integer "room_id"
    t.integer "helper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nursing_homes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "website"
    t.string "contact_person"
    t.integer "phone"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "latitude"
    t.string "longitude"
    t.string "area"
    t.string "authorization"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "detail"
    t.index ["email"], name: "index_nursing_homes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_nursing_homes_on_reset_password_token", unique: true
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "text"
    t.integer "nursing_home_id"
    t.integer "hero_id"
    t.integer "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "behavior"
    t.integer "smile"
    t.integer "cleanliness"
    t.integer "politeness"
    t.integer "physical"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "hero_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_maps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "hero_id"
    t.integer "career_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
