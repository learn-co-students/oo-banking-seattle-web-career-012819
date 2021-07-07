require 'pry'
class Transfer
  attr_accessor :sender,:receiver, :status, :amount

  def initialize (sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      nil
    end
  end

  def execute_transaction
    if valid? && self.status == "pending" && sender.balance > self.amount
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    else
      nil
    end 
  end
end
