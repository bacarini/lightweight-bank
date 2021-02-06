class DebitService
  def initialize(bank_account)
    @bank_account = bank_account
  end

  def debit_credit(transactions)
    amount = transactions.reduce(0) { |sum, transaction| sum + transaction["amount"].to_f }
    @bank_account.balance_cents -= amount
    @bank_account.save()
  end
end
