class TripsController < InheritedResources::Base
  actions :all, except: [:index, :create]

  def index
    if params[:my_trips] == 'true'
      @trips = current_user.all_trips
    else
      @trips = Trip.all
      @trip = Trip.new
    end
  end

  def create
    @trip = Trip.new(params[:trip])

    if @trip.is_driver == 'true'
      @trip.driver_id = current_user.id
    else
      @trip.passengers_trips.build(passenger_id: current_user.id)
    end

    if @trip.save
      redirect_to @trip, notice: "Trip successfully created!"
    else
      render :index
    end
  end

  def show
    @trip = TripDecorator.find(params[:id])
    @proposals = ProposalDecorator.decorate(@trip.proposals)
  end
end
