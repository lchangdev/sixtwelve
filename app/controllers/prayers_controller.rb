class PrayersController < ApplicationController
  def index
    authenticate!
    if member?
      @prayers = Prayer.all
    else
      flash[:notice] = "You do not have access to this page."
      redirect_to groups_path
    end
  end

  def new
    authenticate!
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
    authenticate!
    @prayer = Prayer.find(params[:id])
    @comment = Comment.new
    @comments = @prayer.comments.paginate(:page => params[:page], :per_page => 15)
  end

  def edit
    authenticate!
    @prayer = Prayer.find(params[:id])
  end

  def update
    @prayer = Prayer.find(params[:id])
    if @prayer.update(prayer_params)
      flash[:notice] = "Successfully edited your prayer."
      redirect_to group_path(@prayer.group_id)
    else
      flash.now[:notice] = "Did not save. Please try again."
      render :new
    end
  end

  def destroy
    @prayer = Prayer.find(params[:id])
    @prayer.destroy
    flash[:notice] = "You have deleted your prayer."
    redirect_to group_path(@prayer.group_id)
  end

  private

  def prayer_params
    params.require(:prayer).permit(:title, :description)
  end
end
