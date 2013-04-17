class CreateFights < ActiveRecord::Migration
  def up

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

  def down

  destroy_table "fights"

  end
end
