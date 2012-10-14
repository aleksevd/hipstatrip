# encoding: utf-8

class TripDecorator < Draper::Base
  decorates :trip
  decorates_association :proposals

  def route
    start_address.to_s + " → " + end_address.to_s
  end

  def route_map
    markers = []
    markers << "&markers=color:blue%7Clabel:A%7C#{trip.origin.y},#{trip.origin.x}" if trip.origin.present?
    markers << "&markers=color:green%7Clabel:B%7C#{trip.destination.y},#{trip.destination.x}" if trip.destination.present?

    h.image_tag "http://maps.google.com/maps/api/staticmap?size=640x340&sensor=false#{markers.join}" unless markers.empty?
  end
end
