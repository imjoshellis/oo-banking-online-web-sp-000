class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amt)
    @sender = sender
    @receiver = receiver
    @amount = amt
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount
      @status = rejected
      return "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = complete
    end
  end
end
