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
    @open
  end
end
