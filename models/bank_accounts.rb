require 'active_record'

class BankAccounts < ActiveRecord::Base
  self.table_name = 'bank_accounts'
  self.primary_key = 'id'
end
