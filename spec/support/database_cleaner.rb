require "database_cleaner"

RSpec.configure do |config|
  config.before(:suite) { DatabaseCleaner.strategy = :transaction }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
end
