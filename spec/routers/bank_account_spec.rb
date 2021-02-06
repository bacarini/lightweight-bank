require 'json'

describe 'POST /transfer' do
  include Rack::Test::Methods
  before do
    create(:bank_accounts)
  end

  it "returns insufficient credits" do
    data = {
      "organization_name": "ACME Corp",
      "organization_bic": "OIVUSCLQXXX",
      "organization_iban": "FR10474608000002006107XXXXX",
      "credit_transfers": [
        {
          "amount": "10000000000000",
          "currency": "EUR",
          "counterparty_name": "Bip Bip",
          "counterparty_bic": "CRLYFRPPTOU",
          "counterparty_iban": "EE383680981021245685",
          "description": "Wonderland/4410"
        },
      ]
    }

    response = post("/transfer", data.to_json)

    expect(response.status).to eq(422)
  end

  it "returns account not found" do
    data = {
      "organization_name": "ACME Corp",
      "organization_bic": "9999999999999",
      "organization_iban": "FR10474608000002006107XXXXX",
      "credit_transfers": []
    }

    response = post("/transfer", data.to_json)

    expect(response.status).to eq(404)
  end

  it "returns ok" do
    data = {
      "organization_name": "ACME Corp",
      "organization_bic": "OIVUSCLQXXX",
      "organization_iban": "FR10474608000002006107XXXXX",
      "credit_transfers": [
        {
          "amount": "10",
          "currency": "EUR",
          "counterparty_name": "Bip Bip",
          "counterparty_bic": "CRLYFRPPTOU",
          "counterparty_iban": "EE383680981021245685",
          "description": "Wonderland/4410"
        },
      ]
    }

    response = post("/transfer", data.to_json)

    expect(response.status).to eq(201)
  end
end
