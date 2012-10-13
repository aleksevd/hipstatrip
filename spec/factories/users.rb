# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { "#{generate(:string)}@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
    confirmation_token  nil
    confirmed_at { Time.now }
  end
end
