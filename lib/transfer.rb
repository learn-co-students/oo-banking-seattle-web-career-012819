class Transfer
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @status == "pending" && sender.valid? && receiver.valid?
  end

  def execute_transaction
    if !valid? || @amount > @sender.balance
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  end

  def reverse_transfer
    if @status != "complete"
      return
    end

    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
  end
end
