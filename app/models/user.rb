class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :driver_trips, class_name: "Trip", foreign_key: :driver_id
  has_many :passengers_trips, foreign_key: :passenger_id
  has_many :trips, through: :passengers_trips
  has_many :comments

  def to_s
    name || "Unknown Hipster"
  end

  def all_trips
    driver_trips + trips
  end

  def name
    email.split("@").first rescue ""
  end

  def opened_proposals_on_trip?(trip)
    open_trip_proposals = trip.proposals.where("(proposals.state != 2) OR (proposals.state IS NULL)")
    open_trip_proposals.where(sender_id: id).first.present? || open_trip_proposals.where(receiver_id: id).first.present?
  end
end
