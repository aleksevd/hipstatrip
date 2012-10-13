class PassengersTrip < ActiveRecord::Base
  attr_accessible :trip_id, :passenger_id

  belongs_to :passenger, class_name: "User"
  belongs_to :trip
end
