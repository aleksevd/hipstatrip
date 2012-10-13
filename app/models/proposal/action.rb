class Proposal::Action
  include ActiveAttr::BasicModel
  include ActiveAttr::Attributes
  include ActiveAttr::MassAssignment

  attribute :proposal_id

  validates_presence_of :proposal_id

  def proposal
    Proposal.find(proposal_id)
  end

  def trip
    proposal.trip
  end
end
