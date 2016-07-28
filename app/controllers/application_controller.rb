class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate!
    redirect_to root_url, alert: 'restricted' unless current_user
  end

  def already_logged_in?
    redirect_to issues_path if current_user
  end

  def authenticate_as_admin!
    unless current_user && current_user.admin?
      redirect_to root_url, alert: 'restricted'
    end
  end
end
