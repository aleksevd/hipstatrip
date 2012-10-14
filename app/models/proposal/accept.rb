class Proposal::Accept < Proposal::Action
  def save
    proposal.accept!
  rescue ActiveRecord::RecordInvalid
    self.errors.add :passenger, "You have already accepted this request"
  end
end
