class MembersController < ApplicationController
  def create
    @member = Member.new(member_params)

    if @member.save
      flash[:notice] = "Successfully saved member."
      redirect_to new_group_path
    end
  end

  private

  def member_params
    params.require(:member).permit(:user_id, :group_id)
  end
end
