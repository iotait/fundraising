class AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin, only: [:dashboard]

  def dashboard
  end

  def end_read_a_thon
  end

  private

  def set_admin
    @admin = Admin.find(params[:admin_id])
  end
end
