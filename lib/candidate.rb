class Candidate
  attr_reader :name, :party

  def initialize(attributes)
    @name = attributes[:name]
    @party = attributes[:party]
  end
end
