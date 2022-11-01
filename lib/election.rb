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
    races.flat_map do |race|
      race.candidates
    end
  end

  def vote_counts
    tally = {}
    candidates.each do |candidate|
      tally[candidate.name] = candidate.votes
    end
    tally
  end

  def winners
    # require 'pry'; binding.pry
    races.map do |race|
      next if race.winner.nil?

      race.winner
    end
  end
end
