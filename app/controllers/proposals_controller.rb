class ProposalsController < InheritedResources::Base
  belongs_to :trip
  actions :new, :create

  def create
    @proposal = Proposal.new(params[:proposal])
    @trip = Trip.find(params[:trip_id])
    @proposal.trip = @trip
    @proposal.receiver = @trip.owner
    Rails.logger.info "*" * 100
    logger.info @trip.inspect
    @proposal.sender = current_user
    create!
  end
end
