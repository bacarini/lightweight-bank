require 'active_record'

# Can override table name and primary key
class Transactions < ActiveRecord::Base
  self.table_name = 'transactions'
  self.primary_key = 'id'
end
