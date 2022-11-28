class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def create
    session_params = params.permit(:username, :password)
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to new_session_path, notice: "Please ensure that you have entered the correct username and password."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: "You have been logged out."
  end
end
