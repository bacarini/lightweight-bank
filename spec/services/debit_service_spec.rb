require_relative "../../services/validate_transactions_service"

describe ValidateTransactionsService do
  before do
    @bank_account = create(:bank_accounts, balance_cents: 100)
  end

  let(:service) { DebitService.new(@bank_account) }

  it "debits the amount based on the transactions" do
    transactions = JSON.parse([{"amount": "10"},{"amount": "20"}].to_json)
    service.debit_credit(transactions)
    expect(@bank_account.balance_cents).to eq 70
  end
end
