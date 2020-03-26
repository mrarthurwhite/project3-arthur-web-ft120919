class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :isAdmin?, :theseAreMyRecords?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end


  def isAdmin?
    if !User.isAdmin?(current_user)
      redirect_to events_path
    end
  end
end
