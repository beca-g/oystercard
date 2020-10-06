require './lib/oystercard'
describe Oystercard do
  describe '#initialized cards' do
    it 'freshly initialized cards should have a balance of 0' do
      expect(subject.balance).to eq 0
    end
  end 

  describe '#top_up' do
    it 'tops up the balance by value' do
      expect { subject.top_up(10) }.to change { subject.balance }.by 10
    end

    it 'tops up a maximum of £90' do
      expect { subject.top_up(100) }.to raise_error 'unable to top up more than £90'
    end
  end
end
