# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :passengers_trip, :class => 'PassengersTrips' do
    user_id 1
    trip_id 1
  end
end
