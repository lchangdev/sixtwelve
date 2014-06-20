class CommentsController < ApplicationController
  def create
    @prayer = Prayer.find(params[:prayer_id])

    @comment = Comment.new(comment_params)
    @comment.prayer = @prayer
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to prayer_path(@comment.prayer)
    else
      flash.now[:notice] = "Comment did not save."
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "You have deleted your comment."

    redirect_to prayer_path(@comment.prayer_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
