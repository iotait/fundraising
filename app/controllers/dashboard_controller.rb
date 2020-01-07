class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :about, :calculator]

  def index
  end

  def about
  end

  def calculator
  end
end
