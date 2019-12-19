class AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin, only: [:dashboard]

  def dashboard
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
