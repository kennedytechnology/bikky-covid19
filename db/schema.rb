# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_18_135208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guides", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "guides_restaurants", id: false, force: :cascade do |t|
    t.bigint "guide_id", null: false
    t.bigint "restaurant_id", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string "brand"
    t.string "status"
    t.string "mood"
    t.string "daypart_1"
    t.string "daypart_2"
    t.string "meal_size_1"
    t.string "meal_size_2"
    t.integer "price"
    t.string "deal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "partner"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "location"
    t.text "description"
    t.float "longitude"
    t.float "latitude"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "partner_id", null: false
    t.string "mon_open"
    t.string "mon_close"
    t.string "tue_open"
    t.string "tue_close"
    t.string "wed_open"
    t.string "wed_close"
    t.string "thur_open"
    t.string "thur_close"
    t.string "fri_open"
    t.string "fri_close"
    t.string "sat_open"
    t.string "sat_close"
    t.string "sun_open"
    t.string "sun_close"
    t.index ["partner_id"], name: "index_restaurants_on_partner_id"
  end

  add_foreign_key "restaurants", "partners"
end
