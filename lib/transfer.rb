class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status, :complete

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    (self.sender.valid? && self.sender.balance > self.amount && self.receiver.valid? && self.status == "pending")
  end

  def execute_transaction
    if self.valid?
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    else
      "That transfer has already been reversed"
    end
  end


end
#
# Transfer
#   #valid?
#     can check that both accounts are valid (FAILED - 6)
#     calls on the sender and receiver's #valid? methods (FAILED - 7)
#   #execute_transaction
#     can execute a successful transaction between two accounts (FAILED - 8)
#     each transfer can only happen once (FAILED - 9)
#     rejects a transfer if the sender doesn't have a valid account (FAILED - 10)
#   #reverse_transfer
#     can reverse a transfer between two accounts (FAILED - 11)
#     it can only reverse executed transfers (FAILED - 12)
