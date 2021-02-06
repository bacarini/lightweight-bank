require_relative "../../services/validate_transactions_service"

describe ValidateTransactionsService do
  before do
    transactions = [
      {"amount": "14.5",},
      {"amount": "1000",},
      {"amount": "20",},
    ].to_json
    @transactions = JSON.parse(transactions)
  end

  it "when transactions are allowed" do
    service = ValidateTransactionsService.new(1000000, @transactions)
    expect(service.can_transfer?).to be_truthy
  end

  it "when transactions are not allowed" do
    service = ValidateTransactionsService.new(100, @transactions)
    expect(service.can_transfer?).to be_falsey
  end
end
