require "sinatra"
require "sinatra/activerecord"
require "./exceptions"

if ENV['APP_ENV'] == 'test'
  set :database, "sqlite3:db/lightweight-bank-test.sqlite"
else
  set :database, "sqlite3:db/lightweight-bank.sqlite"
end

Dir["./models/*.rb"].each {|file| require file }
Dir["./handlers/*.rb"].each {|file| require file }
Dir["./services/*.rb"].each {|file| require file }
Dir["./routers/*.rb"].each {|file| require file }
