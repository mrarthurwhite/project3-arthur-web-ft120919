class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :login_required

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def login_required
    # redirect unless logged in!
  end
end
