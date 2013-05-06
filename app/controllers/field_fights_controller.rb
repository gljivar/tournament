class FieldFightsController < ApplicationController
skip_before_filter :require_login , :only => [:index, :status, :repeater ]

  def index

    @competition_id = 1
    @fields = Field.where(:competition_id => @competition_id)

    @limit_previous = 1
    @limit_next = 3

    @fights = []
    @fields.each do |field|
      @field_actual_id = field.id

      @fights_current = Fight.find_by_sql ["SELECT result.* FROM
        (SELECT prev.* FROM (SELECT * FROM fights WHERE field_actual_id = ? AND competitor_winner_id IS NOT NULL ORDER BY number_actual DESC LIMIT ?) AS prev
        UNION ALL SELECT next.* FROM (SELECT * FROM fights WHERE field_actual_id = ? AND competitor_winner_id IS NULL ORDER BY number_actual LIMIT ?) AS next) AS result", @field_actual_id, @limit_previous, @field_actual_id, @limit_next] 

      @fights = @fights + @fights_current
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fights.to_json( :include => { :field_initial => { :only => [:name] }, :field_actual => { :only => [:name] }, :category => { :only => [:name] }, :competitor_blue => { :only => [:last_name, :lot_number], :include => { :club => { :only => [:name] } } }, :competitor_red => { :only => [:last_name, :lot_number], :include => { :club => { :only => [:name] } } }, :competitor_winner => { :only => [:last_name, :lot_number] }, :previous_fight_blue => { :only => [:id, :number], :include => { :field_initial => { :only => [:name] } } }, :previous_fight_red => { :only => [:id, :number], :include => { :field_initial => { :only => [:name] } } } } ) }
    end

  end

  def status

    @competition_id = 1
    @fields = Field.where(:competition_id => @competition_id)

    @limit_previous = 1
    @limit_next = 3

    @fights = []
    @fields.each do |field|
      @field_actual_id = field.id

      @fights_current = Fight.find_by_sql ["SELECT result.* FROM 
       (SELECT prev.* FROM 
        (SELECT * FROM fights WHERE field_actual_id = ? AND competitor_winner_id IS NOT NULL ORDER BY number_actual DESC LIMIT ?) as prev
         UNION ALL
        SELECT next.* FROM
        (SELECT * FROM fights WHERE field_actual_id = ? AND competitor_winner_id IS NULL ORDER BY number_actual LIMIT ?) AS next
       ) as result", @field_actual_id, @limit_previous, @field_actual_id, @limit_next]

      @fights = @fights + @fights_current
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fights.to_json( :include => { :field_initial => { :only => [:name] }, :field_actual => { :only => [:name] }, :category => { :only => [:name] }, :competitor_blue => { :only => [:last_name, :lot_number], :include => { :club => { :only => [:name] } } }, :competitor_red => { :only => [:last_name, :lot_number], :include => { :club => { :only => [:name] } } }, :competitor_winner => { :only => [:last_name, :lot_number] }, :previous_fight_blue => { :only => [:id, :number], :include => { :field_initial => { :only => [:name] } } }, :previous_fight_red => { :only => [:id, :number], :include => { :field_initial => { :only => [:name] } } } } ) }

    end
  end 

  def repeater
    @field_id = params[:id]

    if @field_id == nil
      @field_id = Field.first.id
    end 

    @field = Field.find(@field_id)

    @limit_previous = 1
    @limit_next = 3

    @fights = []
    @field_actual_id = @field.id

    @fights_current = Fight.find_by_sql ["SELECT result.* FROM
     (SELECT prev.* FROM
      (SELECT * FROM fights WHERE field_actual_id = ? AND competitor_winner_id IS NOT NULL ORDER BY number_actual DESC LIMIT ?) AS prev
      UNION ALL
      SELECT next.* FROM
      (SELECT * FROM fights WHERE field_actual_id = ? AND competitor_winner_id IS NULL ORDER BY number_actual LIMIT ?) AS next
     ) AS result", @field_actual_id, @limit_previous, @field_actual_id, @limit_next]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fights_current.to_json( :include => { :field_initial => { :only => [:name] }, :field_actual => { :only => [:name] }, :category => { :only => [:name] }, :competitor_blue => { :only => [:last_name, :lot_number], :include => { :club => { :only => [:name] } } }, :competitor_red => { :only => [:last_name, :lot_number], :include => { :club => { :only => [:name] } } }, :competitor_winner => { :only => [:last_name, :lot_number] }, :previous_fight_blue => { :only => [:id, :number], :include => { :field_initial => { :only => [:name] } } }, :previous_fight_red => { :only => [:id, :number], :include => { :field_initial => { :only => [:name] } } } } ) } 

    end
  end


end
