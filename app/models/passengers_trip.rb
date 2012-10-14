class PassengersTrip < ActiveRecord::Base
  attr_accessible :trip_id, :passenger_id

  belongs_to :passenger, class_name: "User"
  belongs_to :trip

  before_destroy :send_email

  private

  def send_email
    TripMailer.cancelation(passenger).deliver
  end
end
