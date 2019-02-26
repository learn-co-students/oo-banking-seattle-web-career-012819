class BankAccount
  attr_reader :name
  attr_accessor :balance, :status
  @@all = []

  def initialize(name, balance=1000)
    @name = name
    @balance = balance
    @status = "open"
  end

  # can deposit money into its account
  def deposit(amount)
    self.balance += amount
  end

  # can display its balance
  def display_balance
    "Your balance is $#{self.balance}."
  end

  # is valid with an open status and a balance greater than 0
  def valid?
    if self.status == "open" && self.balance > 0
      true
    else
      false
    end
  end

  # can close its account
  def close_account
    self.status = "closed"
  end

  def self.all
    @@all
  end
end
