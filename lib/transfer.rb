class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end

  def valid?
    if ((@sender.valid? == true) && (@receiver.valid? == true))
      return true
    else
      return false
    end
  end

  def execute_transaction
    if @status != "complete"
      if (valid? == true)
        if(sender.balance > amount)
          sender.balance = (sender.balance - @amount)
          receiver.balance = (receiver.balance + @amount)
          @status = "complete"
        else
          @status = "rejected"
          return "Transaction rejected. Please check your account balance."
        end
      else
        @status = "rejected"
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance = (sender.balance + @amount)
      receiver.balance = (receiver.balance - @amount)
      @status = "reversed"
    end

  end
end
