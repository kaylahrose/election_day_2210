require './lib/candidate'
require './lib/race'
require './lib/election'
RSpec.describe Election do
  let(:election) { Election.new('2022') }
  it 'exists' do
    expect(election.year).to eq('2022')
    expect(election.races).to eq([])
  end

  it 'adds races' do
    race1 = Race.new('Virginia District 4 Representative')
    race2 = Race.new('Texas Governor')
    election.add_race(race1)
    election.add_race(race2)
    expect(election.races.length).to eq(2)
    expect(election.races[0]).to be_instance_of(Race)
  end

  it 'registers candidates' do
    race1 = Race.new('Virginia District 4 Representative')
    race2 = Race.new('Texas Governor')
    candidate1 = race1.register_candidate!({ name: 'Diana D', party: :democrat })
    candidate2 = race1.register_candidate!({ name: 'Roberto R', party: :republican })
    candidate3 = race2.register_candidate!({ name: 'Diego D', party: :democrat })
    candidate4 = race2.register_candidate!({ name: 'Rita R', party: :republican })
    candidate5 = race2.register_candidate!({ name: 'Ida I', party: :independent })
    expect(election.candidates.length).to eq(5)
    expect(election.candidates[0]).to be_instance_of(Candidate)
  end

  it 'votes' do
    race1 = Race.new('Virginia District 4 Representative')
    race2 = Race.new('Texas Governor')
    candidate1 = race1.register_candidate!({ name: 'Diana D', party: :democrat })
    candidate2 = race1.register_candidate!({ name: 'Roberto R', party: :republican })
    candidate3 = race2.register_candidate!({ name: 'Diego D', party: :democrat })
    candidate4 = race2.register_candidate!({ name: 'Rita R', party: :republican })
    candidate5 = race2.register_candidate!({ name: 'Ida I', party: :independent })
    4.times { candidate1.vote_for! }
    1.times { candidate2.vote_for! }
    10.times { candidate3.vote_for! }
    6.times { candidate4.vote_for! }
    6.times { candidate5.vote_for! }
    expect(election.vote_counts).to eq({ 'Diana D' => 4,
                                         'Roberto R' => 1,
                                         'Diego D' => 10,
                                         'Rita R' => 6,
                                         'Ida I' => 6 })
  end

  xit 'returns all election winners' do
    race1 = Race.new('Virginia District 4 Representative')
    race2 = Race.new('Texas Governor')
    candidate1 = race1.register_candidate!({ name: 'Diana D', party: :democrat })
    candidate2 = race1.register_candidate!({ name: 'Roberto R', party: :republican })
    candidate3 = race2.register_candidate!({ name: 'Diego D', party: :democrat })
    candidate4 = race2.register_candidate!({ name: 'Rita R', party: :republican })
    candidate5 = race2.register_candidate!({ name: 'Ida I', party: :independent })
    4.times { candidate1.vote_for! }
    1.times { candidate2.vote_for! }
    10.times { candidate3.vote_for! }
    6.times { candidate4.vote_for! }
    6.times { candidate5.vote_for! }
    expect(election.winners).to eq([])
  end
end
