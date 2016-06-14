class Admin::UsersController < ApplicationController
  before_action :authenticate_as_admin!
  before_action :set_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'User created.'
      redirect_to edit_admin_user_path(@user)
    else
      flash.now[:alert] = "Error: #{@user.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'User updated.'
      redirect_to edit_admin_user_path(@user)
    else
      flash.now[:alert] = "Error: #{@user.errors.full_messages.join(', ')}"
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name} deleted."
    redirect_to admin_dashboard_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :admin)
  end
end
