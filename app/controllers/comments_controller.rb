class CommentsController < ApplicationController
  def create
    @owner_class = params[:owner].constantize

    @owner = @owner_class.find(params["#{params[:owner].underscore}_id".to_sym])
    @comment = Comment.new(params[:comment])
    @comment.owner = @owner
    @comment.user_id = current_user.id

    @trip = @owner
    @proposal = @owner

    if @comment.save
      redirect_to :back, notice: "Comment added!"
    else
      render "#{params[:type].underscore}/show", alert: "Failed to add comment"
    end
  end
end
