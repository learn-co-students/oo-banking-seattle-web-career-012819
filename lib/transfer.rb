class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end

  def valid?
    if (@sender.valid?) && (@receiver.valid?)
      return true
    else
      return false
    end
  end

  def execute_transaction
    if valid? == true
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "Transaction rejected. Please check your account balance."
    end
  end
end
