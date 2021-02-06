require "sinatra"
require "sinatra/activerecord"
require "./exceptions"

set :database, "sqlite3:qonto_accounts.sqlite"

Dir["./models/*.rb"].each {|file| require file }
Dir["./handlers/*.rb"].each {|file| require file }
Dir["./services/*.rb"].each {|file| require file }
Dir["./routers/*.rb"].each {|file| require file }
