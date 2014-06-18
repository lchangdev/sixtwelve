class CommentsController < ApplicationController
  def create
    @prayer = Prayer.find(params[:prayer_id])

    @comment = Comment.new(comment_params)
    @comment.prayer = @prayer
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to prayer_path(@comment.prayer)
    else
      flash.now[:notice] = "comment did not save"

      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
