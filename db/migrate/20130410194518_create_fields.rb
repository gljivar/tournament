class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.references :competition

      t.timestamps
    end
    add_index :fields, :competition_id
  end
end
