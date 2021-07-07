class BankAccount
  #one instance of BankAccount can Transfer to another
  attr_accessor :balance, :status
  attr_reader :name


  def initialize(name, balance = 1000, status = 'open')
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    #refactor this!
    if @balance > 0 && @status == 'open'
      true
    else
      false
    end
  end

  def close_account
    @status = 'closed'
  end
end
#end of BankAccount class
