# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "sinatra"
gem "puma"
gem "sqlite3"
gem "sinatra-activerecord"

group :test do
  gem "database_cleaner-active_record"
  gem "rspec"
  gem "pry"
  gem "rack-test"
  gem "factory_bot"
end
