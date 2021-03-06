class ApplicationController < ActionController::Base
  # before_action :require_user

  helper_method :current_user, :logged_in?, :require_user

  def current_user
    @current_user ||= User.find_by(id: session[:author_id]) if session[:author_id]
  end

  def logged_in?
    current_user
  end

  def log_in(user)
    session[:author_id] = user.id
  end

  def require_user
    unless logged_in?
      flash[:notice] = 'You must be logged in to perform that action'
      redirect_to login_path
    end
  end
end
