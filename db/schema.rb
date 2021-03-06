# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_22_185008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "show_id", null: false
    t.string "page_numbers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["show_id"], name: "index_acts_on_show_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender_identity"
    t.string "ethnicity", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "lgbt", default: false
    t.string "author_code"
  end

  create_table "credits", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "show_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_credits_on_author_id"
    t.index ["show_id"], name: "index_credits_on_show_id"
  end

  create_table "french_scenes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "scene_id", null: false
    t.string "page_numbers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["scene_id"], name: "index_french_scenes_on_scene_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.string "address"
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "gender_identity"
    t.integer "age"
    t.boolean "strong_dancer", default: false
    t.boolean "strong_singer", default: false
    t.string "vocal_range"
    t.boolean "lgbt", default: false
    t.string "ethnicity", default: [], array: true
    t.string "notes"
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "productions", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.string "name"
    t.date "closing"
    t.date "opening"
    t.date "rehearsal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "show_id", null: false
    t.string "type"
    t.index ["location_id"], name: "index_productions_on_location_id"
    t.index ["show_id"], name: "index_productions_on_show_id"
  end

  create_table "role_appearances", force: :cascade do |t|
    t.string "roleable_type", null: false
    t.bigint "roleable_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_role_appearances_on_role_id"
    t.index ["roleable_type", "roleable_id"], name: "index_role_appearances_on_roleable"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "gender_identity"
    t.integer "age_min"
    t.integer "age_max"
    t.boolean "strong_dancer", default: false
    t.boolean "strong_singer", default: false
    t.string "ethnicity", default: [], array: true
    t.boolean "lgbt", default: false
    t.bigint "show_id", null: false
    t.index ["show_id"], name: "index_roles_on_show_id"
  end

  create_table "scenes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "act_id", null: false
    t.string "page_numbers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["act_id"], name: "index_scenes_on_act_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "public_domain"
    t.string "description"
    t.string "show_code"
    t.string "rights_holder"
    t.integer "year_written"
    t.string "show_type"
    t.string "genre"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "editor", default: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "acts", "shows"
  add_foreign_key "credits", "authors"
  add_foreign_key "credits", "shows"
  add_foreign_key "french_scenes", "scenes"
  add_foreign_key "locations", "users"
  add_foreign_key "people", "users"
  add_foreign_key "productions", "locations"
  add_foreign_key "productions", "shows"
  add_foreign_key "role_appearances", "roles"
  add_foreign_key "roles", "shows"
  add_foreign_key "scenes", "acts"
end
