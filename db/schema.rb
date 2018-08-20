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

ActiveRecord::Schema.define(version: 20180816140348) do

  create_table "analyse_temps_problemes", force: :cascade do |t|
    t.string "tmpdef"
    t.string "obj"
    t.string "hdirect"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "analyzes", force: :cascade do |t|
    t.integer "equipe_id"
    t.string "duree"
    t.float "efficacite"
    t.float "utilisation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "eff_obj"
    t.float "util_obj"
    t.index ["equipe_id"], name: "index_analyzes_on_equipe_id"
  end

  create_table "backlogs", force: :cascade do |t|
    t.string "mfc"
    t.string "mac"
    t.string "mb"
    t.string "ob"
    t.integer "quart"
    t.string "week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mfcl"
    t.string "ytd"
    t.string "ytdl"
  end

  create_table "calendars", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecart_stocks", force: :cascade do |t|
    t.string "valeur"
    t.string "ecart"
    t.string "obj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipes", force: :cascade do |t|
    t.string "re"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_fields", force: :cascade do |t|
    t.string "name"
    t.string "field_type"
    t.boolean "required"
    t.integer "event_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_type_id"], name: "index_event_fields_on_event_type_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "duree"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start"
    t.datetime "end"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "calendar_id"
    t.integer "team_id"
    t.integer "event_type_id"
    t.text "properties"
    t.float "duration"
    t.index ["calendar_id"], name: "index_events_on_calendar_id"
    t.index ["team_id"], name: "index_events_on_team_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "objectifs", force: :cascade do |t|
    t.string "name"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personnes", force: :cascade do |t|
    t.string "name"
    t.integer "equipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipe_id"], name: "index_personnes_on_equipe_id"
  end

  create_table "rapports", force: :cascade do |t|
    t.integer "cas"
    t.integer "pdp"
    t.integer "cta"
    t.integer "dav"
    t.integer "dsa"
    t.integer "machine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "week"
    t.integer "quart"
    t.integer "next_cas"
    t.integer "next_pdp"
    t.index ["machine_id"], name: "index_rapports_on_machine_id"
  end

  create_table "responsables", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rotation_stocks", force: :cascade do |t|
    t.string "rotation"
    t.string "objectif"
    t.string "mois"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "week"
    t.string "smc"
    t.string "rmc"
    t.string "sma"
    t.string "rma"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quart"
  end

  create_table "taux_expeccs", force: :cascade do |t|
    t.string "cmd"
    t.string "obj"
    t.string "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taux_expefas", force: :cascade do |t|
    t.string "taux"
    t.string "obj"
    t.string "nbligne"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taux_expes", force: :cascade do |t|
    t.string "taux"
    t.string "obj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "calendar_id"
    t.integer "user_count"
    t.index ["calendar_id"], name: "index_teams_on_calendar_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_users_on_team_id"
  end

end
