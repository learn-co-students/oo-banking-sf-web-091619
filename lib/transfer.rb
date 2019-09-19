class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(name, name_two, amount)
    @sender = name
    @receiver = name_two
    @amount = amount
    @status = "pending"
  end
  def valid?
    (@sender.valid? && @receiver.valid?)
  end
  def execute_transaction
    # if (@sender.balance < @amount) || (!@sender.valid?)
    #   @status = "rejected"
    #   return "Transaction rejected. Please check your account balance."
    # elsif (@status != "complete")
    #   @sender.balance -= @amount
    #   @receiver.balance += @amount
    #   @status = "complete"
    # end
    if @status != "complete" && self.valid? && @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif !self.valid? || @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
