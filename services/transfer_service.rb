class TransferService
  def initialize(bank_account)
    @bank_account = bank_account
  end

  def transfer(to)
    Transactions.create(
      counterparty_name: to["counterparty_name"],
      counterparty_iban: to["counterparty_iban"],
      counterparty_bic: to["counterparty_bic"],
      amount_cents: to["amount"].to_f * 100,
      amount_currency: to["currency"],
      bank_account_id: @bank_account.id,
      description: to["description"],
    )
  end
end
