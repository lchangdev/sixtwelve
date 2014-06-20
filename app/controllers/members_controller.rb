class MembersController < ApplicationController
  def create
    @member = Member.new(member_params)

    if @member.save
      flash[:notice] = "Successfully saved member."
      redirect_to new_group_path
    else
      flash[:notice] = "This user is already a member." # does not work
      redirect_to new_group_path
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    flash[:notice] = "You have deleted this member."

    redirect_to group_path(@member.group_id)
  end

  private

  def member_params
    params.require(:member).permit(:user_id, :group_id)
  end
end
