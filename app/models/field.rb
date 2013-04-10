class Field < ActiveRecord::Base
  belongs_to :competition
  attr_accessible :namei, :competition_id
end
