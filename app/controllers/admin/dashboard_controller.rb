class Admin::DashboardController < ApplicationController
  before_action :authenticate_as_admin!
end
