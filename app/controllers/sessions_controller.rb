class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    reset_session

    redirect_to root_url, notice: 'Successfully logged out.'
  end
end
