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

ActiveRecord::Schema.define(version: 2020_03_05_112108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apoabs", force: :cascade do |t|
    t.date "start", null: false
    t.date "end", null: false
    t.decimal "preis", null: false
    t.string "eingetragen", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_apoabs_on_id", unique: true
  end

  create_table "endpoints", force: :cascade do |t|
    t.string "bezeichnung", null: false
    t.string "instrument", null: false
    t.string "study", null: false
    t.string "category", null: false
    t.string "classification", null: false
    t.boolean "herangezogen"
    t.string "anmerkung"
    t.datetime "created_at", default: "2019-04-30 07:45:10", null: false
    t.datetime "updated_at", default: "2019-04-30 07:45:10", null: false
    t.string "updated_by"
    t.index ["id"], name: "index_endpoints_on_id", unique: true
  end

  create_table "gbasubgroups", force: :cascade do |t|
    t.integer "verfahrensnummer", null: false
    t.string "subgroup_name", null: false
    t.boolean "itc", null: false
    t.boolean "nma", null: false
    t.boolean "maic", null: false
    t.integer "itc_eins"
    t.integer "itc_zwei"
    t.integer "itc_drei"
    t.integer "itc_vier"
    t.integer "itc_fuenf"
    t.integer "population_min", null: false
    t.integer "population_max"
    t.string "wahrscheinlichkeit", null: false
    t.string "benefit", null: false
    t.string "studie_eins"
    t.string "studie_zwei"
    t.string "studie_drei"
    t.string "studie_vier"
    t.string "studie_fuenf"
    t.string "studie_sechs"
    t.decimal "jahrestherapiekosten_gba_min"
    t.decimal "jahrestherapiekosten_gba_max"
    t.decimal "zvt_eins_min"
    t.decimal "zvt_eins_max"
    t.decimal "zvt_zwei_min"
    t.decimal "zvt_zwei_max"
    t.decimal "zvt_drei_min"
    t.decimal "zvt_drei_max"
    t.decimal "zvt_vier_min"
    t.decimal "zvt_vier_max"
    t.decimal "zvt_fuenf_min"
    t.decimal "zvt_fuenf_max"
    t.decimal "zvt_sechs_min"
    t.decimal "zvt_sechs_max"
    t.decimal "zvt_sieben_min"
    t.decimal "zvt_sieben_max"
    t.decimal "zvt_acht_min"
    t.decimal "zvt_acht_max"
    t.decimal "zvt_neun_min"
    t.decimal "zvt_neun_max"
    t.decimal "zvt_zehn_min"
    t.decimal "zvt_zehn_max"
    t.string "zvt_name_eins"
    t.string "zvt_name_zwei"
    t.string "zvt_name_drei"
    t.string "zvt_name_vier"
    t.string "zvt_name_fuenf"
    t.string "zvt_name_sechs"
    t.string "zvt_name_sieben"
    t.string "zvt_name_acht"
    t.string "zvt_name_neun"
    t.string "zvt_name_zehn"
    t.string "zvt_status"
    t.datetime "created_at", default: "2019-04-30 07:45:10", null: false
    t.datetime "updated_at", default: "2019-04-30 07:45:10", null: false
    t.string "nach_verhandlung_max"
    t.string "nach_verhandlung_min"
    t.string "brutto_verhandlung_max"
    t.string "brutto_verhandlung_min"
    t.string "anmerkung"
    t.string "updated_by"
    t.date "datum_preisverhandlung"
    t.string "itc_sechs"
    t.string "itc_sieben"
    t.string "itc_acht"
    t.string "itc_neun"
    t.string "itc_zehn"
    t.string "itc_elf"
    t.string "itc_zwoelf"
  end

  create_table "iqsubgroups", force: :cascade do |t|
    t.integer "verfahrensnummer", null: false
    t.string "subgroup_name", null: false
    t.string "act"
    t.boolean "itc", null: false
    t.boolean "nma", null: false
    t.boolean "maic", null: false
    t.integer "itc_eins"
    t.integer "itc_zwei"
    t.integer "itc_drei"
    t.integer "itc_vier"
    t.integer "itc_fuenf"
    t.string "wahrscheinlichkeit", null: false
    t.string "benefit", null: false
    t.string "studie_eins"
    t.string "studie_zwei"
    t.string "studie_drei"
    t.string "studie_vier"
    t.string "studie_fuenf"
    t.string "studie_sechs"
    t.string "bewertung", null: false
    t.string "zvt_status"
    t.datetime "created_at", default: "2019-04-30 07:45:10", null: false
    t.datetime "updated_at", default: "2019-04-30 07:45:10", null: false
    t.string "updated_by"
    t.string "anmerkung"
    t.string "itc_sechs"
    t.string "itc_sieben"
    t.string "itc_acht"
    t.string "itc_neun"
    t.string "itc_zehn"
    t.string "itc_elf"
    t.string "itc_zwoelf"
    t.index ["id"], name: "index_iqsubgroups_on_id", unique: true
  end

  create_table "jtkaks", force: :cascade do |t|
    t.string "subgruppe", null: false
    t.string "dosierung_eins", null: false
    t.string "dosierung_zwei", null: false
    t.string "dosierung_drei", null: false
    t.string "dosierung_vier", null: false
    t.string "dosierung_fuenf", null: false
    t.string "dosierung_sechs", null: false
    t.string "pzn_eins", null: false
    t.string "pzn_zwei"
    t.string "pzn_drei"
    t.string "pzn_vier"
    t.string "pzn_fuenf"
    t.string "pzn_sechs"
    t.string "eingetragen", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_jtkaks_on_id", unique: true
  end

  create_table "jtkakts", force: :cascade do |t|
    t.string "subgruppe", null: false
    t.string "dosierung", null: false
    t.string "pzn", null: false
    t.string "zuweisung", null: false
    t.decimal "hr_ges_netto"
    t.decimal "apu_netto"
    t.decimal "kosten_gkv"
    t.decimal "jtk_gkv"
    t.decimal "jtk_apu_netto"
    t.string "eingetragen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "rabatt_ges"
    t.index ["id"], name: "index_jtkakts_on_id", unique: true
  end

  create_table "jtkgbas", force: :cascade do |t|
    t.string "subgruppe", null: false
    t.string "dosierung", null: false
    t.string "pzn", null: false
    t.string "zuweisung", null: false
    t.decimal "hr_ges_netto"
    t.decimal "apu_netto"
    t.decimal "kosten_gkv"
    t.decimal "jtk_gkv"
    t.decimal "jtk_apu_netto"
    t.string "eingetragen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_jtkgbas_on_id", unique: true
  end

  create_table "jtkgbs", force: :cascade do |t|
    t.string "subgruppe", null: false
    t.string "dosierung_eins", null: false
    t.string "dosierung_zwei", null: false
    t.string "dosierung_drei", null: false
    t.string "dosierung_vier", null: false
    t.string "dosierung_fuenf", null: false
    t.string "dosierung_sechs", null: false
    t.string "pzn_eins", null: false
    t.string "pzn_zwei"
    t.string "pzn_drei"
    t.string "pzn_vier"
    t.string "pzn_fuenf"
    t.string "pzn_sechs"
    t.string "eingetragen", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "verfahren"
    t.index ["id"], name: "index_jtkgbs_on_id", unique: true
  end

  create_table "jtkpvhs", force: :cascade do |t|
    t.string "subgruppe", null: false
    t.string "dosierung", null: false
    t.string "pzn", null: false
    t.string "zuweisung", null: false
    t.decimal "hr_ges_netto"
    t.decimal "apu_netto"
    t.decimal "kosten_gkv"
    t.decimal "jtk_gkv"
    t.decimal "jtk_apu_netto"
    t.string "eingetragen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "rabatt_ges"
    t.index ["id"], name: "index_jtkpvhs_on_id", unique: true
  end

  create_table "jtkpvs", force: :cascade do |t|
    t.string "subgruppe", null: false
    t.string "dosierung_eins", null: false
    t.string "dosierung_zwei", null: false
    t.string "dosierung_drei", null: false
    t.string "dosierung_vier", null: false
    t.string "dosierung_fuenf", null: false
    t.string "dosierung_sechs", null: false
    t.string "pzn_eins", null: false
    t.string "pzn_zwei"
    t.string "pzn_drei"
    t.string "pzn_vier"
    t.string "pzn_fuenf"
    t.string "pzn_sechs"
    t.string "eingetragen", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "verfahren"
    t.date "datum"
    t.index ["id"], name: "index_jtkpvs_on_id", unique: true
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
    t.boolean "science", null: false
    t.boolean "over_one_million"
    t.date "befristung"
    t.string "label"
    t.boolean "erst_einreichung"
    t.datetime "created_at", default: "2019-04-01 09:42:20", null: false
    t.datetime "updated_at", default: "2019-04-01 09:42:20", null: false
    t.string "updated_by"
    t.index "lower((brand_name)::text) varchar_pattern_ops", name: "index_mains_on_lower_brand_name_varchar_pattern_ops"
    t.index "lower((drug_name)::text) varchar_pattern_ops", name: "index_mains_on_lower_drug_name_varchar_pattern_ops"
    t.index "lower((field_of_application)::text) varchar_pattern_ops", name: "index_mains_on_lower_field_of_application_varchar_pattern_ops"
    t.index "lower((manufacturer)::text) varchar_pattern_ops", name: "index_mains_on_lower_manufacturer_varchar_pattern_ops"
    t.index ["gba_number"], name: "index_mains_on_gba_number", unique: true
  end

  create_table "preis_anmerkungs", force: :cascade do |t|
    t.integer "verfahrensnummer"
    t.string "anmerkung"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preises", force: :cascade do |t|
    t.string "pzn", null: false
    t.string "wirkstoff", null: false
    t.string "anbietername", null: false
    t.string "volumen", null: false
    t.string "einheit", null: false
    t.string "menge", null: false
    t.string "verpackungseinheit", null: false
    t.string "ppu", null: false
    t.string "nbr", null: false
    t.string "erstattzngsbetrag", null: false
    t.string "apu_hap", null: false
    t.string "tax_ek", null: false
    t.string "hr_ges", null: false
    t.string "ges_vk", null: false
    t.string "v", null: false
    t.string "drf_bez", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pzns", force: :cascade do |t|
    t.integer "pzn"
    t.string "Wirkstoffe"
    t.string "Artikelname"
    t.string "Anbietername"
    t.string "Volumen"
    t.string "Einheit"
    t.integer "Menge"
    t.string "Einheiten"
    t.decimal "ppu"
    t.decimal "nbr"
    t.decimal "erstattungsbetrag"
    t.decimal "apu_hap"
    t.decimal "taxe_ek"
    t.decimal "hr_ges"
    t.decimal "vk_ges"
    t.string "v"
    t.string "drf_bezeichnung"
    t.date "aufnahme"
    t.string "wirkstoff_menge"
    t.decimal "apothekenabschlag"
    t.date "created_at"
    t.date "updated_at"
  end

  create_table "schiedsspruches", force: :cascade do |t|
    t.string "date"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "verfahrensnummer"
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
    t.string "studien_name", null: false
    t.string "studien_typ", null: false
    t.boolean "safety", null: false
    t.boolean "label", null: false
    t.boolean "extension", null: false
    t.boolean "controlled", null: false
    t.boolean "registry", null: false
    t.boolean "randomized", null: false
    t.string "randomization", null: false
    t.string "population"
    t.string "evidenz", null: false
    t.string "annotation"
    t.boolean "clinicaltrials"
    t.string "clinical"
    t.boolean "single_arm", null: false
    t.string "IWT"
    t.boolean "multizenter", null: false
    t.boolean "double_bline", null: false
    t.boolean "multinational", null: false
    t.boolean "efficacy", null: false
    t.string "bezeichnung", null: false
    t.string "sponsor", null: false
    t.string "phase", null: false
    t.boolean "dosefinding", null: false
    t.boolean "ongoing", null: false
    t.boolean "nhs", null: false
    t.datetime "created_at", default: "2019-04-30 07:45:10", null: false
    t.datetime "updated_at", default: "2019-04-30 07:45:10", null: false
    t.string "updated_by"
    t.index ["id"], name: "index_studies_on_id", unique: true
  end

  create_table "study_arms", force: :cascade do |t|
    t.string "stud_name"
    t.string "controlled_intervention", null: false
    t.string "medication", null: false
    t.string "dosing", null: false
    t.string "verabreichnung"
    t.integer "number_patient", null: false
    t.string "bezeichnung"
    t.datetime "created_at", default: "2019-04-30 07:45:11", null: false
    t.datetime "updated_at", default: "2019-04-30 07:45:11", null: false
    t.string "anmerkung"
    t.string "updated_by"
    t.string "behandlungsnummer"
    t.string "behandlungstyp"
    t.boolean "zutreffend"
  end

  create_table "subgroups", force: :cascade do |t|
    t.integer "verfahrensnummer", null: false
    t.string "subgroup_name", null: false
    t.string "act"
    t.boolean "itc", null: false
    t.boolean "nma", null: false
    t.boolean "maic", null: false
    t.integer "itc_eins"
    t.integer "itc_zwei"
    t.integer "itc_drei"
    t.integer "itc_vier"
    t.integer "itc_fuenf"
    t.string "wahrscheinlichkeit", null: false
    t.string "benefit", null: false
    t.string "studie_eins"
    t.string "studie_zwei"
    t.string "studie_drei"
    t.string "studie_vier"
    t.string "studie_fuenf"
    t.string "studie_sechs"
    t.string "zvt_status"
    t.datetime "created_at", default: "2019-04-30 07:45:10", null: false
    t.datetime "updated_at", default: "2019-04-30 07:45:10", null: false
    t.string "updated_by"
    t.string "anmerkung"
    t.string "itc_sechs"
    t.string "itc_sieben"
    t.string "itc_acht"
    t.string "itc_neun"
    t.string "itc_zehn"
    t.string "itc_elf"
    t.string "itc_zwoelf"
    t.index ["id"], name: "index_subgroups_on_id", unique: true
  end

  create_table "tables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
