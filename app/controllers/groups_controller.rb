class GroupsController < ApplicationController

  def index
    @groups = Group.all.order(:name)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = "Successfully saved your group."
      redirect_to groups_path
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :security_question, :security_answer)
  end

end
