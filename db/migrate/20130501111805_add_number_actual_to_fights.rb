class AddNumberActualToFights < ActiveRecord::Migration
  def change
    add_column :fights, :number_actual, :integer
  end
end
