# encoding: utf-8

class TripDecorator < Draper::Base
  decorates :trip
  decorates_association :proposals

  def route
    start_address.to_s + " → " + end_address.to_s
  end
end
