class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :about]
  
  def index
  end

  def about
  end

  def user
  end
end
