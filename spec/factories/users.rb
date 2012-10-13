# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { "#{generate(:string)}@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
  end
end
