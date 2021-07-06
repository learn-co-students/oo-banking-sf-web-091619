class BankAccount

attr_reader :name
attr_accessor :status, :bank_account, :balance

  def initialize (name)
  @name = name
  @bank_account = bank_account
  @balance = 1000
  @status = "open"
  end

  def deposit (money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
  (@status == "open" && @balance > 0) ? true : false
  end

  def close_account
    @status = "closed"
  end

end
