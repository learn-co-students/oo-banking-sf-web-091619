require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end
  

  def execute_transaction
    if @status == 'pending' && sender.balance >= @amount && valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    elsif sender.balance < @amount || !valid?
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    else
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end
end
