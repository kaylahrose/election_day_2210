class Candidate
  attr_reader :name, :party, :votes

  def initialize(attributes)
    @name = attributes[:name]
    @party = attributes[:party]
    @votes = 0
  end

  def vote_for!
    @votes += 1
  end
end
