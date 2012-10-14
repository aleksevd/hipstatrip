class TripMailer < ActionMailer::Base
  default :from => "no-reply@binarycode.r12.railsrumble.com"

  def cancelation(passenger, trip)
    @passenger = passenger
    @trip = TripDecorator.decorate(trip)
    mail(:to => passenger.email, :subject => "Trip canceled")
  end
end
