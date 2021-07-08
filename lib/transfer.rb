class Transfer
  attr_reader :sender, :receiver, :amount, :status
  # Transfer initializes with a sender, receiver, amount, and status of pending.
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  # Checks the validity of both sender and receiver BankAccount objects
  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    else
      "Nothing to reverse."
    end
  end
end

# avi = BankAccount.new("Avi")
# amanda = BankAccount.new("Amanda")
# transfer = Transfer.new(amanda, avi, 50)
# bad_transfer = Transfer.new(amanda, avi, 4000)
