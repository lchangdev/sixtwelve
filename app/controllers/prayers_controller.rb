class PrayersController < ApplicationController
  def index
    @prayers = Prayer.all.order(updated_at: :desc)

  end

  def new
    @prayer = Prayer.new
  end

  def create
    @prayer = Prayer.new(prayer_params)

    if @prayer.save
      flash[:notice] = "Successfully saved your prayer request."
      redirect_to prayers_path
    else
      flash.now[:notice] = "Did not save. Please try again."
      redner :new
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
