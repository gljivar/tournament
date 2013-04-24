class FieldFightsController < ApplicationController
  def index

    @competition_id = 1
    @fields = Field.where(:competition_id => @competition_id)

    @limit_previous = 1
    @limit_next = 3

    @fights = []
    @fields.each do |field|
      @field_actual_id = field.id

      @fights_current = Fight.find_by_sql ["SELECT * FROM (SELECT * FROM (SELECT * FROM fights WHERE field_actual_id = ? AND competitor_winner_id IS NOT NULL ORDER BY number DESC LIMIT ?) UNION ALL SELECT * FROM (SELECT * FROM fights WHERE field_actual_id = ? AND competitor_winner_id IS NULL ORDER BY number LIMIT ?))", @field_actual_id, @limit_previous, @field_actual_id, @limit_next] 

      @fights = @fights + @fights_current
      @fights.each do |fight|  
        field.fights_actual.push(fight) 
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @fields.to_json( :include => :fights_actual)  }
      #format.json { render json: @fields.to_json( :include => { :fights_actual => { :include => { :field_initial => { :only => [:name] }, :field_actual => { :only => [:name] }, :category => { :only => [:name] }, :competitor_blue => { :only => [:last_name] }, :competitor_red => { :only => [:last_name] }, :competitor_winner => { :only => [:last_name] }, :previous_fight_blue => { :only => [:number] }, :previous_fight_red => { :only => [:number] } } } } ) }
      
      format.json { render json: @fights.to_json( :include => { :field_initial => { :only => [:name] }, :field_actual => { :only => [:name] }, :category => { :only => [:name] }, :competitor_blue => { :only => [:last_name] }, :competitor_red => { :only => [:last_name] }, :competitor_winner => { :only => [:last_name] }, :previous_fight_blue => { :only => [:number] }, :previous_fight_red => { :only => [:number] } } ) }
    end

  end
end
