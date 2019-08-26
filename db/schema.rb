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

ActiveRecord::Schema.define(version: 2019_08_26_104735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_participations", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_participations_on_artist_id"
    t.index ["event_id"], name: "index_artist_participations_on_event_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "photo"
    t.string "spotify_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "price"
    t.string "category"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.string "photo"
    t.string "buy_link"
    t.bigint "user_id"
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_events_on_place_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.text "details"
    t.string "category"
    t.string "address"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "stars"
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_reviews_on_event_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_participations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_user_participations_on_event_id"
    t.index ["user_id"], name: "index_user_participations_on_user_id"
  end

  create_table "user_styles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "style_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["style_id"], name: "index_user_styles_on_style_id"
    t.index ["user_id"], name: "index_user_styles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "age"
    t.string "photo"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "artist_participations", "artists"
  add_foreign_key "artist_participations", "events"
  add_foreign_key "events", "places"
  add_foreign_key "events", "users"
  add_foreign_key "reviews", "events"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_participations", "events"
  add_foreign_key "user_participations", "users"
  add_foreign_key "user_styles", "styles"
  add_foreign_key "user_styles", "users"
end
