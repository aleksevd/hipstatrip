class Search
  include ActiveAttr::BasicModel
  include ActiveAttr::Attributes
  include ActiveAttr::MassAssignment

  attribute :origin_address
  attribute :destination_address
  attribute :origin
  attribute :destination

  def origin_address=(value)
    self.origin = geocode(value)
    super
  end

  def destination_address=(value)
    self.destination = geocode(value)
    super
  end

  def trips
    Trip.matching_route(origin, destination)
  end

private

  def geocode(value)
    return nil unless value.present?

    coords = Geocoder.coordinates(value)

    return nil unless coords.present?

    Point.from_x_y(coords[1], coords[0], 4326)
  end
end
