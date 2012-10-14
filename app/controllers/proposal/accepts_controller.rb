class Proposal::AcceptsController < ActionController::Base

  def create
    @accept = Proposal::Accept.new(params.slice(:proposal_id))

    if @accept.save
      flash[:notice] = "Request accepted successfully"
    else
      flash[:alert] = @accept.errors.full_messages
    end

    redirect_to @accept.trip
  end
end
