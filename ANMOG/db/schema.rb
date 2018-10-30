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

ActiveRecord::Schema.define(version: 2018_10_19_093849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gbasubgroups", force: :cascade do |t|
    t.string "manufacturer", null: false
    t.integer "gba_number", null: false
    t.string "name", null: false
    t.string "act", null: false
    t.boolean "evidence", null: false
    t.boolean "itc", null: false
    t.string "study_one"
    t.string "study_two"
    t.string "study_thre"
    t.string "study_four"
    t.string "study_five"
    t.string "study_six"
    t.integer "population_min", null: false
    t.integer "population_max", null: false
    t.decimal "cost_zvt", null: false
    t.decimal "cost_drug", null: false
    t.string "benefit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mains", force: :cascade do |t|
    t.integer "gba_number", null: false
    t.string "drug_name", null: false
    t.string "brand_name", null: false
    t.string "manufacturer", null: false
    t.boolean "orphan_drug", null: false
    t.boolean "new_field", null: false
    t.boolean "expired_time", null: false
    t.boolean "basic_evidence", null: false
    t.boolean "exceedance_money", null: false
    t.boolean "lors_of_odd", null: false
    t.date "start_procedure", null: false
    t.date "end_procedure"
    t.string "status", null: false
    t.string "field_of_application", null: false
    t.string "indication", null: false
    t.integer "subgroups", null: false
    t.decimal "benefit_percentige", null: false
    t.boolean "benefit", null: false
    t.string "market_availability", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "lower((brand_name)::text) varchar_pattern_ops", name: "index_mains_on_lower_brand_name_varchar_pattern_ops"
    t.index "lower((drug_name)::text) varchar_pattern_ops", name: "index_mains_on_lower_drug_name_varchar_pattern_ops"
    t.index "lower((field_of_application)::text) varchar_pattern_ops", name: "index_mains_on_lower_field_of_application_varchar_pattern_ops"
    t.index "lower((manufacturer)::text) varchar_pattern_ops", name: "index_mains_on_lower_manufacturer_varchar_pattern_ops"
    t.index ["gba_number"], name: "index_mains_on_gba_number", unique: true
  end

  create_table "skcs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_skcs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_skcs_on_reset_password_token", unique: true
  end

  create_table "studies", force: :cascade do |t|
    t.integer "gba_number", null: false
    t.string "study_name", null: false
    t.integer "study_arm_number", null: false
    t.boolean "pivotal", null: false
    t.boolean "cross_over", null: false
    t.boolean "extension", null: false
    t.boolean "controlled", null: false
    t.boolean "registry", null: false
    t.boolean "nhs", null: false
    t.boolean "randomized", null: false
    t.string "randomization", null: false
    t.integer "population", null: false
    t.string "study_length", null: false
    t.string "evidenz", null: false
    t.string "annotation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_studies_on_id", unique: true
  end

  create_table "study_arms", force: :cascade do |t|
    t.string "controlled_intervention", null: false
    t.integer "gba_number", null: false
    t.string "medication", null: false
    t.string "dosing", null: false
    t.boolean "blinded", null: false
    t.boolean "itc", null: false
    t.integer "number_patient", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subgroups", force: :cascade do |t|
    t.string "manufacturer", null: false
    t.integer "gba_number", null: false
    t.string "sub_name", null: false
    t.string "act", null: false
    t.boolean "evidence", null: false
    t.boolean "itc", null: false
    t.integer "studies", null: false
    t.integer "population_min", null: false
    t.integer "population_max", null: false
    t.decimal "cost_zvt"
    t.decimal "cost_drug"
    t.string "lightihood", null: false
    t.string "benefit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_subgroups_on_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
