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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130410222547) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clubs", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "clubs", ["country_id"], :name => "index_clubs_on_country_id"

  create_table "competitions", :force => true do |t|
    t.string   "name"
    t.datetime "date_start"
    t.datetime "date_end"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "competitors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "category_id"
    t.integer  "club_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "competitors", ["category_id"], :name => "index_competitors_on_category_id"
  add_index "competitors", ["club_id"], :name => "index_competitors_on_club_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "code3"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fields", :force => true do |t|
    t.string   "name"
    t.integer  "competition_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "fields", ["competition_id"], :name => "index_fields_on_competition_id"

  create_table "fights", :force => true do |t|
    t.integer  "number"
    t.integer  "category_id"
    t.integer  "field_initial_id"
    t.integer  "field_actual_id"
    t.integer  "competitor_blue_id"
    t.integer  "competitor_red_id"
    t.integer  "previous_fight_blue_id"
    t.integer  "previous_fight_red_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

end
