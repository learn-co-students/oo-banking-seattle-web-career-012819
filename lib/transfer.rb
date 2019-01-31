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

  # check for accounts being active and non-zero balance
  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  # transfer funds if account active and has enough balance
  def execute_transaction
    # binding.pry
    if @status == "pending" && valid? && sender.balance > amount
      @status = "complete"
      self.sender.balance -= amount
      self.receiver.balance += amount
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && valid? && receiver.balance > amount
      @status = "reversed"
      self.sender.balance += amount
      self.receiver.balance -= amount
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
