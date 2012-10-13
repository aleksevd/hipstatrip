class Trip < ActiveRecord::Base

  attr_accessible :driver_id, :starts_at, :is_driver, :comments_attributes, :start_address, :end_address
  attr_accessor :is_driver

  belongs_to :driver, class_name: "User"
  has_many :passengers_trips
  has_many :passengers, through: :passengers_trips, class_name: "User", foreign_key: :passenger_id
  has_many :comments, as: :owner
  has_many :proposals

  accepts_nested_attributes_for :passengers_trips

  def owner
    driver || passengers.first
  end

  def driver_type?
    driver_id.present?
  end
end
