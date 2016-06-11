class SessionsController < ApplicationController
  before_action :already_logged_in?, only: [:new]

  def new
  end

  def create
    user = User.find_by_chip_id(params[:chip_id])

    if user
      session[:user_id] = user.id
      flash[:success] = "#{user.name} signed in."
      redirect_to issues_path
    else
      redirect_to login_url, alert: 'User not found.'
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session

    redirect_to root_url, notice: 'Successfully logged out.'
  end
end
