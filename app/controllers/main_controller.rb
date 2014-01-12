class MainController < ApplicationController
  def index
    if current_user
      @profile = current_user.profile
      @friends_count = current_user.friends_count
    end
  end
end
