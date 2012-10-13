class Proposal::Accept < Proposal::Action
  def save
    proposal.accept!
  end
end
