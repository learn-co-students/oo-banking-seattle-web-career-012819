class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
    @@all << self
  end

  def deposit(cash)
    self.balance += cash unless cash < 0
  end

  def withdrawal(cash)
    self.balance -= cash
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    self.status == 'open' && self.balance > 0 ? true : false
  end

  def close_account
    self.status = 'closed'
  end

end
