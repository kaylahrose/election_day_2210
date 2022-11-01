require './lib/candidate'
class Race
  attr_reader :office, :candidates, :open

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(candidate)
    candidates << Candidate.new(candidate)
    candidates.last
  end

  def open?
    open
  end

  def close!
    @open = false
  end

  def winner
    if open?
      false
    else
      # require 'pry'; binding.pry
      candidates.max_by do |candidate|
        candidate.votes
      end
    end
  end

  def tie?
    votes = candidates.map { |candidate| candidate.votes }
    most_votes = votes.max
    # require 'pry'; binding.pry
    first_index = votes.index(most_votes)

    index = votes.rindex(most_votes)
    leading_votes = votes.each_index.select { |i| votes[i] == most_votes }
    if leading_votes.count > 1
        true
    else
        false
    end
  end
end
