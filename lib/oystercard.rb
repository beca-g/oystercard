class Oystercard
  attr_reader :balance, :travelling
  MAX_VALUE = 90
  MIN_VALUE = 1

  def initialize
    @balance = 0
    @travelling = false
  end  

  def max_value?(value)
    (@balance + value) > MAX_VALUE
  end

  def lack_of_funds
    @balance < MIN_VALUE
  end

  def top_up(value) 
    fail "unable to up by #{value}: over max limit" if max_value?(value)

    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    @travelling
  end

  def touch_in
    fail 'Unable to travel, balance less than £1' if lack_of_funds

    @travelling = true
  end

  def touch_out
    @travelling = false
  end
  
end
