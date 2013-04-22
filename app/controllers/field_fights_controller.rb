class FieldFightsController < ApplicationController
  def index
    @fights = Fight.find_by_sql ["SELECT * FROM (SELECT * FROM (SELECT * FROM fights WHERE field_actual_id = ? AND competitor_winner_id IS NOT NULL ORDER BY number DESC LIMIT ?) UNION ALL SELECT * FROM (SELECT * FROM fights WHERE field_actual_id = ? AND competitor_winner_id IS NULL ORDER BY number LIMIT ?))", 1, 1, 1, 3] 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fights.to_json( :include => { :field_initial => { :only => [:name] }, :field_actual => { :only => [:name] }, :category => { :only => [:name] }, :competitor_blue => { :only => [:last_name] }, :competitor_red => { :only => [:last_name] }, :competitor_winner => { :only => [:last_name] }, :previous_fight_blue => { :only => [:number] }, :previous_fight_red => { :only => [:number] } } ) }
    end

  end
end
