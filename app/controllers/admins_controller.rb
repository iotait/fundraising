class AdminsController < ApplicationController
  before_action :set_admin, only: [:show]
  before_action :set_schools, only: [:show]

  def index
    @admins = Admin.all
    render :index
  end

  def show
  end

  def new
    @admin = Admin.new
    render :new
  end

  def create
    Admin.create(admin_params)
    redirect_to admins_path
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def set_schools
    @schools = School.where(admin_id: @admin.id)
  end

  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :phone)
  end
end
