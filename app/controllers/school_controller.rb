class SchoolController < ApplicationController
  before_action :set_school, only: [:show]

  def index
    @schools = School.all
  end

  def show
  end

  def new
    @school = School.new
  end

  def create
    School.create(school_params)
    redirect_to schools_path
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :email, :phone, :address, :about, :goal)
  end
end
