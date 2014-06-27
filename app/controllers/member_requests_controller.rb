class MemberRequestsController < ApplicationController

  def create
    # @member_request = MemberRequest.new(member_request_params)
    @member_request = MemberRequest.new
    @member_request.group = Group.find(params[:group_id])
    @member_request.user = current_user
    if @member_request.save
      MemberRequestMailer.new_member_request(current_user, @member_request.group).deliver
      MemberRequestMailer.request_notification(current_user, @member_request.group).deliver
      redirect_to groups_path
    else
      render groups_path
    end
  end

  private

  # def member_request_params
  #   params.require(:member_request).permit(:group).merge(user: current_user)
  # end
end
