class TripDecorator < Draper::Base
  decorates :trip
  decorates_association :proposals
end
