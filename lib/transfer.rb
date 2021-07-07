class Transfer

  attr_accessor :amount, :status

  attr_reader :sender, :receiver

@@all_transfers = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else 
      false
    end
  end

def execute_transaction
    if self.valid? && sender.balance >= amount && @status != "complete"
  sender.balance -= amount
  receiver.balance += amount
  @status = "complete"
@@all_transfers << self
    else 
     @status = "rejected"
     "Transaction rejected. Please check your account balance."
    end
end

def reverse_transfer
  # if self.valid? && receiver.balance >= amount && @status = "complete"
  #     else 
  #      @status = "rejected"
  #      "Transaction rejected. Please check your account balance."
  #     end
  if @@all_transfers.include?(self)
    sender.balance += amount
    receiver.balance -= amount
    @status = "reversed"
  else 
  end
end

end #of class
