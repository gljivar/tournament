class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      t.string :first_name
      t.string :last_name
      t.references :category
      t.references :club

      t.timestamps
    end
    add_index :competitors, :category_id
    add_index :competitors, :club_id
  end
end
