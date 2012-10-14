class ProposalsController < InheritedResources::Base
  before_filter :authenticate_user!

  belongs_to :trip
  actions :new, :create, :show

  def new
    @proposal = Proposal.new
    @proposal.comments.build
    new!
  end

  def show
    @proposal = Proposal.find(params[:id])
    show!
  end

  def create
    @proposal = Proposal.new(params[:proposal])
    @trip = Trip.find(params[:trip_id])
    @proposal.trip = @trip
    @proposal.receiver = @trip.owner
    Rails.logger.info "*" * 100
    logger.info @trip.inspect
    @proposal.sender = current_user
    @proposal.comments.first.user_id = current_user.id
    create! { @trip }
  end
end
