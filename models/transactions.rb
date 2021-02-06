require 'active_record'

class Transactions < ActiveRecord::Base
  self.table_name = 'transactions'
  self.primary_key = 'id'
end
