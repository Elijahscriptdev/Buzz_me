# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_user, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "welcome to Buzzlife #{@user.name}"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Your profile was successfully edited'
      redirect_to @user
    else
      render 'edit'
    end
    end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
