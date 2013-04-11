class Competitor < ActiveRecord::Base
  belongs_to :category
  belongs_to :club
  attr_accessible :lot_number, :first_name, :last_name, :category_id, :club_id
end
