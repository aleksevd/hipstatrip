class ProposalDecorator < Draper::Base
  decorates :proposal

  def description
    if sender == trip.owner
      "#{sender} offers to go with you"
    else
      "#{sender} offers to drive you"
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
