class AddCompetitorWinnerToFight < ActiveRecord::Migration
  def change
    add_column :fights, :competitor_winner_id, :integer
  end
end
