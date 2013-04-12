class Fight < ActiveRecord::Base
  attr_accessible :number, :category_id, :field_initial_id, :field_actual_id, :competitor_blue_id, :competitor_red_id, :previous_fight_blue_id, :previous_fight_red_id, :competitor_winner_id

  belongs_to :category

  belongs_to :field_initial, :class_name => "Field", :foreign_key => :field_initial_id
  belongs_to :field_actual, :class_name => "Field", :foreign_key => :field_actual_id

  belongs_to :competitor_blue, :class_name => "Competitor", :foreign_key => :competitor_blue_id
  belongs_to :competitor_red, :class_name => "Competitor", :foreign_key => :competitor_red_id
  belongs_to :competitor_winner, :class_name => "Competitor", :foreign_key => :competitor_winner_id

  belongs_to :previous_fight_blue, :class_name => "Fight", :foreign_key => :previous_fight_blue_id
  belongs_to :previous_fight_red, :class_name => "Fight", :foreign_key => :previous_fight_red_id

#  after_save :propagate_winner

  def propagate_winner
    @fb = Fight.find(:first, :conditions => { :previous_fight_blue_id => id } )
    if @fb
      @fb.competitor_blue_id = competitor_winner_id
      @fb.save
    end

    @fr = Fight.find(:first, :conditions => { :previous_fight_red_id => id } )
    if @fr
      @fr.competitor_red_id = competitor_winner_id
      @fr.save
    end
  end 

end
