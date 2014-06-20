class GroupsController < ApplicationController

  def index
    @groups = Group.all.order(:name)
    if signed_in?
      @members = Member.where("user_id = ?", current_user.id)
    else
      @members = Member.new
    end
  end

  def new
    admin!
    @group = Group.new
    @member = Member.new
    @users = User.all.order(:name)
    @groups = Group.all.order(:name)
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = "Successfully saved group."
      redirect_to new_group_path
    end
  end

  def show
    authenticate!
    @group = Group.find(params[:id])
    @members = Member.where(group_id: params[:id])
    @prayers = @group.prayers.paginate(:page => params[:page], :per_page => 15)
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def prayer_params
    params.require(:prayer).permit(:title)
  end

end
