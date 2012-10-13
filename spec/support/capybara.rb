require 'capybara/rspec'
require 'capybara/rails'

RSpec.configure do |config|
  config.include Warden::Test::Helpers, :type => :request
end
