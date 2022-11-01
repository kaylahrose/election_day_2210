require './lib/candidate'

RSpec.describe Candidate do
    let(:diana) { Candidate.new({ name: 'Diana D', party: :democrat }) }
  it 'exists and has attributes' do
    expect(diana).to be_instance_of(Candidate)
    expect(diana.name).to be('Diana D')
    expect(diana.party).to be(:democrat)
  end

  it 'counts votes' do
    expect(diana.votes).to be(0)
  end

  it 'votes' do
    expect(diana.votes).to be(0)
    3.times diana.vote_for!
    expect
    expect(diana.votes).to eq(3)
    diana.vote_for!
    expect(diana.votes).to eq(4)
  end
end
