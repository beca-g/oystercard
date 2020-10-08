class Oystercard
  attr_reader :balance, :entry_station
  MAX_VALUE = 90
  MIN_VALUE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def max_value?(value)
    (@balance + value) > MAX_VALUE
  end

  def lack_of_funds
    @balance < MIN_VALUE
  end

  def top_up(value)
    raise "unable to up by #{value}: over max limit" if max_value?(value)

    @balance += value
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    raise 'Unable to travel, balance less than £1' if lack_of_funds

    @entry_station = station
  end

  def touch_out
    deduct(MIN_VALUE)
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end
end
