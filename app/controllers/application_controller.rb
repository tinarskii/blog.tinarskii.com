class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :current_user

  def is_logged_in?
    return !!session[:user_id]
  end

  def require_login
    if !is_logged_in?
      redirect_to new_session_path, notice: "You must be logged in to do that."
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
