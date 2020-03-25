class WelcomesController < ApplicationController



  def index
    if logged_in?
      redirect_to user_url(current_user)
    end
  end

  #
end
