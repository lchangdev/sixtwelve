class MemberRequestMailer < ActionMailer::Base
  default from: "sixtwelveinfo@gmail.com",
    return_path: 'sixtwelveinfo@gmail.com'

  def new_member_request(user, group)
    @user = user
    @group = group
    mail(to: @user.email, subject: 'Request to join group received.')
  end

  def request_notification(user, group)
    @user = user
    @group = group
    mail(to: 'sixtwelveinfo@gmail.com', subject: 'New member request')
  end
end
