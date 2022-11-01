require './lib/candidate'
require './lib/race'

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
end
