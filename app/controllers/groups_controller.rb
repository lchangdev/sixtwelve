class GroupsController < ApplicationController

  def index
    @groups = Group.all.order(:name)
  end

  def new
    @group = Group.new
    @member = Member.new
    @users = User.all
    @groups = Group.all
  end

  def create
    @group = Group.new(group_params)


    if @group.save
      flash[:notice] = "Successfully saved group."
      redirect_to new_group_path
    end

  end

  def show
    @group = Group.find(params[:id])
    @members = Member.where(group_id: params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :security_question, :security_answer)
  end

end
