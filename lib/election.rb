class Election
  attr_reader :year, :races

  def initialize(year)
    @year = year
    @races = []
  end
end
