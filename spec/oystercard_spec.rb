require './lib/oystercard'
describe Oystercard do
  let(:station) { double :station }
  describe '#initialized cards' do
    it 'freshly initialized cards should have a balance of 0' do
      expect(subject.balance).to eq 0
    end
    
    it 'checks that the card has an empty journey list by default' do 
      expect(subject.journeys).to eq []
    end
  end 

  describe '#top_up' do
    it 'tops up the balance by value' do
      expect { subject.top_up(10) }.to change { subject.balance }.by 10
    end

    it 'tops up a maximum of £90' do
      expect { subject.top_up(100) }.to raise_error "unable to up by 100: over max limit"
    end
  end

  describe '#injourney?' do 
    it 'initially has in_journey? =  when created' do

      expect(subject.in_journey?).not_to be nil
    end
  end

  describe '#touch_in' do
    it 'checks that touch_in has updated the entry_station' do
      subject.top_up(50)
      expect { subject.touch_in(:station) }.to change { subject.entry_station }.to eq (:station)
    end

    it 'raises an error if card balance is lower than £1' do
      expect { subject.touch_in(:station)}.to raise_error 'Unable to travel, balance less than £1'
    end
  end

  describe '#touch_out' do
    it 'on touch_out the balance is deducted by #min_value' do
      subject.top_up(20)
      subject.touch_in(:station)
      expect { subject.touch_out(:station) }.to change { subject.balance }.by (-Oystercard::MIN_VALUE)     
    end

    it 'updates @entry_station to nil once #touch_out' do
      subject.top_up(20)
      subject.touch_in(:station)
      subject.touch_out(:station)
      expect(subject.entry_station).to be nil
    end
  end

  describe '#current_journey' do
    it 'touching in and out creates one journey' do
      subject.top_up(20)
      subject.touch_in(:station)
      subject.touch_out(:station)
      expect(subject.journey).to include(:entry_station, :exit_station)
    end 
  end
end
