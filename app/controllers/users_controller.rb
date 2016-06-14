class UsersController < ApplicationController

  def new
    session[:user_id] = nil

    @user = User.new
  end

  def create
    @user = User.new(name: user_params[:name], admin: false)

    if @user.save
      flash[:success] = "Hello #{@user.name}."
      session[:user_id] = @user.id
      redirect_to issues_path
    else
      flash.now[:alert] = "Error: #{@user.errors.full_messages.join(', ')}"
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Session ended for #{@user.name}."
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
