class ProposalMailer < ActionMailer::Base
  default :from => "no-reply@binarycode.r12.railsrumble.com"

  def new_proposal(trip, user)
    @url  = url_for(trip)
    @trip = TripDecorator.decorate(trip)
    mail(:to => user.email, :subject => "New proposal!")
  end

  def acceptance(trip, user)
    @url  = url_for(trip)
    @trip = TripDecorator.decorate(trip)
    mail(:to => user.email, :subject => "Proposal accepted!")
  end

  def cancelation(trip, user)
    @url  = url_for(trip)
    @trip = TripDecorator.decorate(trip)
    mail(:to => user.email, :subject => "Proposal cancelled")
  end
end
