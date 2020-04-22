class SessionsController < ApplicationController
  # skip_before_action :require_user, only: %i[new create]
  def create
    @categories = Category.all
    user = User.find_by(name: params[:session][:name])
    if user
      log_in user
      flash[:success] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash[:success] = 'something is wrong with your log in information'
      render 'new'
    end
  end

  def new
    @categories = Category.all
  end

  def destroy
    session[:author_id] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to root_path
  end
end
