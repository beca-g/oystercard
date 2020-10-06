class Oystercard
  attr_reader :balance
  MAX_VALUE = 90
  def initialize
    @balance = 0
  end  

  def max_value?(value)
    (@balance + value) > MAX_VALUE
  end

  def top_up(value) 
    fail "unable to up by #{value}: over max limit" if max_value?(value)

    @balance += value
  end
end
