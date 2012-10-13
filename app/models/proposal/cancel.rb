class Proposal::Cancel < Proposal::Action
  def save
    proposal.cancel!
  end
end
