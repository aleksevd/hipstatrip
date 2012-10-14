class Search
  include ActiveAttr::BasicModel
  include ActiveAttr::Attributes
  include ActiveAttr::MassAssignment

  attribute :origin_address
  attribute :destination_address

  def trips
    Trip.all
  end
end
