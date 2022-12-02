class BuddyController < ApplicationController
  def show
    @buddies = Buddy.all
  end

  def new
    @buddy = Buddy.new
  end

  def index
    @buddies = Buddy.all
    render json: @buddies
  end

  def create
    @buddy = Buddy.new(buddy_params)
    @buddy.save
    redirect_to buddy_path
  end

  private
  def buddy_params
    params.permit(:content)
  end
end
