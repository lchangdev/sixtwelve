class CommentsController < ApplicationController
  def create
    @prayer = Prayer.find(params[:prayer_id])

    @comment = Comment.new(comment_params)
    @comment.prayer = @prayer
    if @comment.save
      redirect_to "/prayers/#{@prayer.id}"
    else
      flash.now[:notice] = "Could not post your comment. Please try again."
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
