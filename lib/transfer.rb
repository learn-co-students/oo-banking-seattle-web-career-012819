class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

    @last_transfer = nil
  end

  def valid?
    (@sender.valid? && @receiver.valid?)
  end

  def execute_transaction
    if (@sender.balance < @amount)
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif  !(@status == "complete" && self.valid?)
      @last_transfer = self

      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed" 
    end
  end

end
