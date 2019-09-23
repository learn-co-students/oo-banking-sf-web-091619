class Transfer

  attr_accessor :sender, :receiver, :amount, :status

    def initialize(sender, receiver, amount, status="pending")
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = status
    end
  
    def receiver
      @receiver
    end

    def valid?
      if @sender.valid? && @receiver.valid?
        return true
      else
        return false
      end

    end

    def execute_transaction
      if @sender.balance >= @amount && valid? && @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
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
