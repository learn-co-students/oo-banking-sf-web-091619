require 'pry'

class Transfer

    attr_reader :sender, :receiver, :amount
    attr_accessor :status

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
    end

    def valid?
      sender.valid? && receiver.valid? ? true : false
    end

    def execute_transaction
      if @status == "pending" && valid? == true && sender.balance >= amount
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
      elsif sender.balance < amount || valid? == false
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if @status == "complete"
        sender.balance += amount
        receiver.balance -= amount
        @status = "reversed"
      end
    end


    
end
