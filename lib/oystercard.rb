class Oystercard
  attr_reader :balance
  def initialize
    @balance = 0
  end  

  def top_up(value) 
    fail 'unable to top up more than £90' if (@balance + value) > 90

    @balance += value
  end
end
