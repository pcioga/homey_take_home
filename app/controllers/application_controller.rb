class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :current_user, :user_signed_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def require_login
    redirect_to login_path, alert: 'You must be logged in to access this page.' unless current_user
  end
end
