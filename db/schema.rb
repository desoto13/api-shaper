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

ActiveRecord::Schema[7.2].define(version: 2025_02_02_130200) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guests", force: :cascade do |t|
    t.bigint "id_number"
    t.string "email", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_guests_on_email", unique: true
    t.index ["id_number"], name: "index_guests_on_id_number", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "guest_id", null: false
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.integer "number_of_nights", null: false
    t.integer "number_of_guests", null: false
    t.integer "number_of_adults"
    t.integer "number_of_children"
    t.integer "number_of_infants"
    t.string "status", null: false
    t.string "currency", null: false
    t.float "payout_price", null: false
    t.float "security_price", null: false
    t.float "total_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_date"], name: "index_reservations_on_end_date"
    t.index ["guest_id"], name: "index_reservations_on_guest_id"
    t.index ["start_date"], name: "index_reservations_on_start_date"
    t.index ["status"], name: "index_reservations_on_status"
  end

  add_foreign_key "reservations", "guests"
end
