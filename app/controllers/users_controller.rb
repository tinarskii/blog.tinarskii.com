class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def show
    @user = User.find(params[:id])
    @articles = Article.where(author_id: params[:id])
  end

  def index
    @current_user = current_user
  end

  def new
    @user = User.new
  end

  def create
    if User.find_by(username: params[:user][:username])
      redirect_to new_user_path, notice: "Username is already taken."
    elsif User.find_by(email: params[:user][:email])
      redirect_to new_user_path, notice: "Email is already taken."
    else
      @user = User.new(user_params)
      if @user.valid?
        session[:user_id] = @user.id
        @user.save
        redirect_to @user
      else
        redirect_to register_path, notice: "Oops! Something went wrong. Please try again later."
      end
    end
  end

  def articles
    @articles = Article.where(author_id: current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :email, :bio, :password)
  end
end