class Search
  include ActiveAttr::Model

  attribute :origin_address
  attribute :destination_address
  attribute :origin
  attribute :destination
  attribute :driver, default: false

  def origin_address=(value)
    self.origin = geocode(value)
    super
  end

  def destination_address=(value)
    self.destination = geocode(value)
    super
  end

  def trips
    Trip.matching_route(origin, destination).of_type(driver)
  end

private

  def geocode(value)
    return nil unless value.present?

    coords = Geocoder.coordinates(value)

    return nil unless coords.present?

    Point.from_x_y(coords[1], coords[0], 4326)
  end
end
