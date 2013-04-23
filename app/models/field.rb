class Field < ActiveRecord::Base
  belongs_to :competition
  attr_accessible :name, :competition_id

  has_many :fights_initial, :class_name => 'Fight', :foreign_key => :field_initial_id
  has_many :fights_actual, :class_name => 'Fight', :foreign_key => :field_actual_id

end
