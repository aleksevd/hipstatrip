class ProposalDecorator < Draper::Base
  decorates :proposal

  def description
    if trip.driver_id.present?
      "#{sender} wants to participate in the trip"
    else
      "#{sender} offers to be a driver of this trip"
    end
  end

  def state_name
    case state
    when 1 then "Accepted"
    when 2 then "Canceled"
    else "New"
    end
  end
end
