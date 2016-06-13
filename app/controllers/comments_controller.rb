class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
