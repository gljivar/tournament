class AddLotNumberToCompetitor < ActiveRecord::Migration
  def change
    add_column :competitors, :poll_number, :integer
  end
end
