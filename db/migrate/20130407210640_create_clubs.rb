class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.references :country

      t.timestamps
    end
    add_index :clubs, :country_id
  end
end
