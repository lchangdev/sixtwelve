class GroupsController < ApplicationController

  def index
    @groups = Group.all.order(:name)
    @memberships = []
    if signed_in?
      current_user.groups.each do |group|
        group.members.each do |member|
          @memberships << member.group_id
        end
      end
    end
  end

  def new
    admin! && authenticate!
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
    if member?
      @group = Group.find(params[:id])
      @members = Member.where(group_id: params[:id])
      @prayers = @group.prayers.paginate(:page => params[:page], :per_page => 15)
    else
      flash[:notice] = "You do not have access to this page."
      redirect_to groups_path
    end
  end

  def edit
    authenticate!
    if member?
      @group = Group.find(params[:id])
    else
      flash[:notice] = "You do not have access to this page."
      redirect_to groups_path
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "Successfully edited group."
      redirect_to new_group_path
    else
      flash.now[:notice] = "Did not save. Please try again."
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = "You have deleted this group."
    redirect_to new_group_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def prayer_params
    params.require(:prayer).permit(:title)
  end

end
