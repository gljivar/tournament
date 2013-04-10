class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps
    end
  end
end
