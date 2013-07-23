class Game < ActiveRecord::Base
  has_many :players, through: :rounds, limit: 2
  has_many :rounds
end


  
