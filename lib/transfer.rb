class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amt)
    @sender = sender
    @receiver = receiver
    @amount = amt
    @status = pending
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end
end
