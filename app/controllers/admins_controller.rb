class AdminsController < ApplicationController
  before_action :set_teacher, only: [:show]

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

  def admin_params
    params.require(:admin).permit(:name, :email, :phone)
  end
end
