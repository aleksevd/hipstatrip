class ProposalMailer < ActionMailer::Base
  default :from => "notifications@hipstatrip.com"

  def new_proposal(trip, user)
    @url  = url_for(trip)
    mail(:to => user.email, :subject => "New proposal!")
  end

  def acceptance(trip, user)
    @url  = url_for(trip)
    mail(:to => user.email, :subject => "Proposal accepted!")
  end

  def cancelation(trip, user)
    @url  = url_for(trip)
    mail(:to => user.email, :subject => "Proposal rejected")
  end
end
