require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Race do
  let(:race) { Race.new('Texas Governor') }
  it 'exists' do
    expect(race.office).to eq('Texas Governor')
    expect(race.candidates).to eq([])
  end

  it 'registers candidates' do
    candidate1 = race.register_candidate!({ name: 'Diana D', party: :democrat })
    expect(candidate1).to be_instance_of(Candidate)
    expect(candidate1.name).to eq('Diana D')
    expect(candidate1.party).to eq(:democrat)
  end

  it 'returns all candidates' do
    candidate1 = race.register_candidate!({ name: 'Diana D', party: :democrat })
    candidate2 = race.register_candidate!({ name: 'Roberto R', party: :republican })
    expect(race.candidates).to eq([candidate1, candidate2])
  end

  it 'returns if race is open' do
    expect(race.open?).to eq(true)
  end

  it 'closes race' do
    expect(race.open?).to eq(true)
    race.close!
    expect(race.open?).to eq(false)
  end

  it 'returns winner' do
    # expect(race.winner).to eq(false)
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
    race2.close!

    expect(race2.winner).to eq(candidate3)
  end
end
