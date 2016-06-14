class UsersController < ApplicationController
  def new
    redirect_to issues_path if session[:user_id]
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
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
