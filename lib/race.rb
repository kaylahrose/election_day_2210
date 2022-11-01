class Race
    attr_reader :office, :candidates
    def initialize(office)
        @office = office
        @candidates = []
    end
end
