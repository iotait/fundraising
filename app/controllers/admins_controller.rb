class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update]
  before_action :set_schools, only: [:show]

  # GET /admins
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  def create
    Admin.create(admin_params)
    redirect_to admins_path
  end

  # PATCH/PUT /admins/1
  def update
    if @admin.update(admin_params)
      redirect_to admins_path
    else
      render :edit
    end
  end

  # DELETE /admins/1
  def destroy
    @admin.destroy
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
