require "pry"

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end

  def execute_transaction
    if self.valid? && @status != "complete"
      move_money(@sender, @receiver, @amount, "complete")
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      move_money(@receiver, @sender, @amount, "reversed")
    end
  end

  def move_money(from_a, to_b, dollar_amount, set_status)
    from_a.deposit(-dollar_amount)
    to_b.deposit(dollar_amount)
    @status = set_status
  end
end
