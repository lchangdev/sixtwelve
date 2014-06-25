class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def member?
    memberships = []
    current_user.groups.each do |group|
      group.members.each do |member|
        memberships << member.group_id
      end
    end
    memberships.include?(params[:id].to_i)
  end

  def signed_in?
    current_user.present?
  end

  def admin?
    user = User.find_by(id: current_user.id)
    user.role == 'admin'
  end

  def admin!
    unless signed_in? && admin?
      flash[:notice] = "You do not have access to this page."
      redirect_to groups_path
    end
  end

  def set_current_user(user)
    session[:user_id] = user.id
  end

  def authenticate!
    unless signed_in?
      flash[:notice] = 'You need to sign in if you want to do that.'
      redirect_to groups_path
    end
  end

  helper_method :member?
  helper_method :current_user
  helper_method :signed_in?
  helper_method :admin?
  helper_method :authenticate!
end
