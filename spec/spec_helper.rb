ENV['APP_ENV'] = 'test'

require 'rspec'
require 'rack/test'
require 'database_cleaner/active_record'
require 'factory_bot'

require './server'

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    FactoryBot.find_definitions
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
