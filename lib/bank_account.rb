class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  # initializes each BankAccount object with a name, balance of $1k, and status of open
  def initialize(name)
    @name = name
    @balance = 1_000
    @status = 'open'
  end

  # deposits money into its account
  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  # checks if a BankAccount is both open and not empty
  def valid?
    @status == 'open' && @balance > 0
  end

  def close_account
    @status = 'closed'
  end


end
