# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_user, only: %i[new create]
  def create
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

  def new; end

  def destroy
    session[:author_id] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to login_path
  end
end
