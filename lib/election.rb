require './lib/candidate'
require './lib/race'
require 'objspace'
class Election
  attr_reader :year, :races

  def initialize(year)
    @year = year
    # @races = require 'pry'; binding.pry
    # ObjectSpace.each_object(Race).to_a
  end
  def races
    ObjectSpace.each_object(Race).to_a
  end

  def add_race(race)
    races << race
  end

#   def candidates
#     require 'pry'; binding.pry
#   end
end
