class Trip < ActiveRecord::Base
  attr_accessible :driver_id, :starts_at, :is_driver, :comments_attributes,
                  :start_address, :end_address, :seats, :seats_occupied
  attr_accessor :is_driver

  belongs_to :driver, class_name: "User"
  has_many :passengers_trips, dependent: :destroy
  has_many :passengers, through: :passengers_trips, class_name: "User", foreign_key: :passenger_id
  has_many :comments, as: :owner, dependent: :destroy
  has_many :proposals, dependent: :destroy

  validates :seats, allow_nil: true,
                    numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 },
                    if: :driver_type?

  accepts_nested_attributes_for :passengers_trips

  def owner
    driver || passengers.first
  end

  def driver_type?
    driver_id.present?
  end

  def self.close_to(trip)
    scope = where("ST_DWithin(origin, :origin, :range) AND ST_DWithin(destination, :destination, :range)", origin: trip.origin, destination: trip.destination, range: search_range)

    if trip.new_record?
      scope
    else
      scope.where { id != my { trip.id } }
    end
  end

  def self.search_range
    20_000
  end
end
