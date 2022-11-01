require './lib/candidate'
require './lib/race'
require 'objspace'
class Election
  attr_reader :year, :races

  def initialize(year)
    @year = year
  end

  def races
    ObjectSpace.each_object(Race).to_a
  end

  def add_race(race)
    races << race
  end

  def candidates
    # require 'pry'; binding.pry
    races.flat_map do |race|
        race.candidates
    end
  end

  def vote_counts
    tally = {}
    candidates.each do |candidate|
    # require 'pry'; binding.pry
    tally[candidate.name] = candidate.votes
    end
    tally
  end
end
