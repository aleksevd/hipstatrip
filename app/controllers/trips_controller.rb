class TripsController < InheritedResources::Base
  actions :all, except: [:index, :create]
  before_filter :authenticate_user!, except: :show

  def index
    @trips = current_user.all_trips
  end

  def create
    @trip = Trip.new(params[:trip])

    if (@trip.is_driver.to_s == 'true') || (@trip.is_driver.to_s == "1")
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

  def update
    update!(:notice => "Trip is comleted!") { trips_path }
  end

  def show
    @trip = TripDecorator.find(params[:id])
    @proposals = ProposalDecorator.decorate(@trip.proposals)
  end
end
