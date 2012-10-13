class TripsController < InheritedResources::Base
  actions :all, except: [:new, :index]

  def index
    @trips = Trip.all
    @trip = Trip.new
  end
end
