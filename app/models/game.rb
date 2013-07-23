class Game < ActiveRecord::Base
  has_many :players, through: :rounds, limit: 2
  has_many :rounds

  def self.generate_url
    puts "Generating URL"
    letters_and_numbers = ('a'..'z').to_a + ('0'..'9').to_a
    result = ""
    6.times do 
      result << letters_and_numbers.sample
    end
    result
  end

  def formatted_url
    "http://localhost:9393/#{self.url}"
  end
end


  
