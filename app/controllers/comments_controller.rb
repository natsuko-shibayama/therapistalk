class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/talks/#{@comment.talk.id}"
    else
      @talk = Talk.find(params[:talk_id])
      @user = User.find(@talk.user_id)
      @comments = @talk.comments
      render "talks/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, talk_id: params[:talk_id])
  end
end
