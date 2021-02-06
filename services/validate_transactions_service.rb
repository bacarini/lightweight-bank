class ValidateTransactionsService
  def initialize(total_available_in_cents, transactions)
    @total_available = total_available_in_cents / 100
    @transactions = transactions
  end

  def can_transfer?
    total_to_transfer = @transactions.reduce(0) { |sum, transaction| sum + transaction["amount"].to_f }
    return @total_available >= total_to_transfer
  end
end
