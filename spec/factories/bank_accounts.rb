FactoryBot.define do
  factory :bank_accounts do
    sequence(:id) { |n| n }

    organization_name	{ "ACME Corp" }
    balance_cents	{ 10000000 }
    iban { "FR10474608000002006107XXXXX" }
    bic	{ "OIVUSCLQXXX" }
  end
end
