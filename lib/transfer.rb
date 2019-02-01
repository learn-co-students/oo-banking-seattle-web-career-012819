class Transfer
  
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  @@all = []
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount 
    @status = 'pending'
    
    @@all << self 
    
  end 
  
  def self.all
    @@all 
  end 
  
  def valid?
    if sender.valid? && receiver.valid?
      true 
    else
      false 
    end 
  end 
  
  def execute_transaction
    if @sender.balance < @amount 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      puts "Duplicate transaction rejected. Transaction was already excuted."
    else 
      @sender.deposit(@amount * -1 ) 
      @receiver.deposit(@amount )
      @status = "complete"
    end
  end
  
  def last_transaction
    @@all[-1]
  end
  
  def reverse_transfer
    if last_transaction.status == "complete"
      @sender.deposit(last_transaction.amount)
      @receiver.deposit(last_transaction.amount * -1)
      @status = "reversed"
    end 
  end 

end
