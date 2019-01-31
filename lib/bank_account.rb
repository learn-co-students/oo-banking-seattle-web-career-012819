class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name, balance = 1000)
    @name =name
    @balance = balance
    @status = "open"
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    !!(self.status == "open" && self.balance > 0)
  end

  def close_account
    self.status = "closed"
  end

end

#
# can't change its name
# #deposit
#  can deposit money into its account (FAILED - 5)
# #display_balance
#  can display its balance (FAILED - 6)
# #valid?
#  is valid with an open status and a balance greater than 0 (FAILED - 7)
# #close_account
#  can close its account (FAILED - 8)
