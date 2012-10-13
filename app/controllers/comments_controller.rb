class CommentsController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @comment = Comment.new(params[:comment])
    @comment.owner = @trip

    if @comment.save
      redirect_to :back, notice: "Comment added!"
    else
      render "trips/show", alert: "Failed to add comment"
    end
  end
end
