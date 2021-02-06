require 'active_record'

# Can override table name and primary key
class BankAccounts < ActiveRecord::Base
  self.table_name = 'bank_accounts'
  self.primary_key = 'id'
end
