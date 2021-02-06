require_relative "../../handlers/bulk_transactions_handler"

class BankAccounts

end

describe BulkTransactionsHandler do
  context "when transactions are allowed" do
    it "creates the respective transactions" do
      data = {
        "organization_name": "ACME Corp",
        "organization_bic": "OIVUSCLQXXX",
        "organization_iban": "FR10474608000002006107XXXXX",
        "credit_transfers": [
          {
            "amount": "23.17",
            "currency": "EUR",
            "counterparty_name": "Bip Bip",
            "counterparty_bic": "CRLYFRPPTOU",
            "counterparty_iban": "EE383680981021245685",
            "description": "Neverland/6318"
          },
          {
            "amount": "98234",
            "currency": "EUR",
            "counterparty_name": "Wile E Coyote",
            "counterparty_bic": "ZDRPLBQI",
            "counterparty_iban": "DE9935420810036209081725212",
            "description": "//Spacex/AJGRBX/32"
          },
          {
            "amount": "8024.99",
            "currency": "EUR",
            "counterparty_name": "Bugs Bunny",
            "counterparty_bic": "RNJZNTMC",
            "counterparty_iban": "FR0010009380540930414023042",
            "description": "2020/DuckSeason/"
          },
          {
            "amount": "200",
            "currency": "EUR",
            "counterparty_name": "Daffy Duck",
            "counterparty_bic": "DDFCNLAM",
            "counterparty_iban": "NL24ABNA5055036109",
            "description": "2020/RabbitSeason/"
          }
        ]
      }.to_json
      expect { BulkTransactionsHandler.new(JSON.parse(data)).transfer }.to raise_error(InsufficientCredits)
    end
  end
end
