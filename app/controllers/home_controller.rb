class HomeController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    if is_logged_in?
      @current_user = current_user
    end
  end
end
