RSpec.configure do |config|
  config.include Shoulda::Matchers::ActionController, :type => :routing
end
