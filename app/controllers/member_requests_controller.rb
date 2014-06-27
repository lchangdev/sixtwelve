class MemberRequestsController < ApplicationController

  def create
    # @member_request = MemberRequest.new(member_request_params)
    @member_request = MemberRequest.new
    @member_request.group = Group.find(params[:group_id])
    @member_request.user = current_user
    if @member_request.save
      # , @member_request.group
      MemberRequestMailer.new_member_request(current_user).deliver
      # MemberRequestMailer.request_notification(current_user, @member_request.group).deliver
      flash[:notice] = "Successfully sent your request."
      redirect_to groups_path
    else
      flash[:notice] = "Error please try again."
      render groups_path
    end
  end
end
