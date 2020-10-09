require './lib/station'
describe Station do
  it { is_expected.to respond_to(:zone)}
  it 'responds to station name' do
    expect(Station.new).to respond_to(:name)
  end
end
