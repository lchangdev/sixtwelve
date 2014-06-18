class PrayersController < ApplicationController
  def index
    @prayers = Prayer.all.order(updated_at: :desc)
  end

  def new
    @prayer = Prayer.new
    @group = Group.find(params[:group_id])
  end

  def create
    @prayer = Prayer.new(prayer_params)

    @prayer.group_id = params[:group_id]
    @prayer.user_id = current_user.id


    if @prayer.save
      flash[:notice] = "Successfully saved your prayer request."
      redirect_to group_path(@prayer.group)
    else
      flash.now[:notice] = "Did not save. Please try again."
      render :new
    end
  end

  def show
    @prayer = Prayer.find(params[:id])
    @comment = Comment.new
  end

  private

  def prayer_params
    params.require(:prayer).permit(:title, :description)
  end
end
