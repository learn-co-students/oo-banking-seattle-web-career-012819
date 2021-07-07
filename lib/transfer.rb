class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  # can check that both accounts are valid
  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end

  # can execute a successful transaction between two accounts
  def execute_transaction
    # accounts must be valid
    # sender must have more money in thier account, than the transfer amount
    # status should be "pending" so that transaction cannot be repeated
    if self.valid? && self.sender.balance >= self.amount && self.status == "pending"
      # remove amount from sender's balance, add amount to receiver's balance, change status to complete
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  # can reverse a transfer between two accounts, it can only reverse executed transfers
  def reverse_transfer
    if self.valid? && self.receiver.balance > self.amount && self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def self.all
    @@all
  end
end
