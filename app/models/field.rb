class Field < ActiveRecord::Base
  belongs_to :competition
  attr_accessible :name
end
