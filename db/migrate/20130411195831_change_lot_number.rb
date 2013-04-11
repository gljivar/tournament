class ChangeLotNumber < ActiveRecord::Migration
  def up
    rename_column :competitors, :poll_number, :lot_number
  end

  def down
    rename_column :competitors, :lot_number, :poll_number
  end
end
