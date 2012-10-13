RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  sequence :string do |n|
    "string#{n}"
  end
end
