class MemberRequestMailer < ActionMailer::Base
  default from: "sixtwelveinfo@gmail.com"

  def new_member_request(user)
    @user = user
    mail(to: @user.email, subject: 'Request to join user received.')
  end

  def request_notification(admin)

  end
end
