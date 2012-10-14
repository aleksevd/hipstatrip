class TripMailer < ActionMailer::Base
  default :from => "notifications@hipstatrip.com"

  def cancelation(passenger)
    @passenger = passenger
    mail(:to => passenger.email, :subject => "Trip canceled")
  end
end
