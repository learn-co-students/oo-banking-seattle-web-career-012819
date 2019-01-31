class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def initialize(sender, receiver, amount, status = 'pending')
      @status = status
      @amount = amount
      @receiver = receiver
      @sender = sender
      @@all << self
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance > amount && self.status == 'pending' && valid?
      sender.withdrawal(self.amount)
      receiver.deposit(self.amount)
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if receiver.balance > amount && self.status == 'complete' && valid?
      sender.deposit(self.amount)
      receiver.withdrawal(self.amount)
      self.status = 'reversed'
    else
      self.status = 'rejected'
      "Reversal rejected! Buzz off, 'customer'! "
    end
  end

end
