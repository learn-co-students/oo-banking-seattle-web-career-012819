class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, status = 'pending', amount)
     @sender = sender
     @receiver = receiver
     @status = status
     @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if (@sender.balance -= @amount) > 0 && @status != 'complete'
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance  += @amount
      @status = "reversed"
    end
  end
end
#end of Transfer class
