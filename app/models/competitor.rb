class Competitor < ActiveRecord::Base
  belongs_to :category
  belongs_to :club
  attr_accessible :lot_number, :first_name, :last_name, :category_id, :club_id

  def full_name
    first_name + ' ' + last_name
  end

  def initial_and_last_name
    first_name[0, 1] + '. ' + last_name
  end
end
