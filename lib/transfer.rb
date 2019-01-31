require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount
  attr_reader :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid? && @sender.balance >= amount
      return true
    end
    false
  end

  def execute_transaction
    if valid?
      if @status == 'pending'
        @sender.deposit(-amount)
        @receiver.deposit(+amount)
        @status = 'complete'
      end
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @receiver.deposit(-amount)
      @sender.deposit(+amount)
      @status = 'reversed'
    end
  end

end
