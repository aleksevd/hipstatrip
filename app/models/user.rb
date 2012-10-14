class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :driver_trips, class_name: "Trip", foreign_key: :driver_id
  has_many :passengers_trips, foreign_key: :passenger_id
  has_many :trips, through: :passengers_trips
  has_many :comments

  def to_s
    email
  end

  def all_trips
    driver_trips + trips
  end

  def name
    email.split("@").first rescue ""
  end

  def requested_trip?(trip)
    (trip.proposals.map(&:sender_id) + trip.proposals.map(&:receiver_id)).include?(id)
  end
end
