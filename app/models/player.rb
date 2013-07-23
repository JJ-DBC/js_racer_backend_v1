class Player < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :games, through: :rounds
  has_many :rounds

end
