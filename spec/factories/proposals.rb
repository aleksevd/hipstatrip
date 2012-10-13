# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :proposal do
    association :sender, factory: :user
    association :receiver, factory: :user
  end
end
