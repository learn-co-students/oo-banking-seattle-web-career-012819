class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  
    @@all << self
  end

  def deposit(amount)
    @balance += amount # unless money < 0
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    self.status = "closed"
  end

end
