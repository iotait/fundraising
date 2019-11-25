class SchoolsController < ApplicationController
  before_action :set_school, only: [:show]
  before_action :set_teachers, only: [:show]

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

  def set_teachers
    @teachers = Teacher.where(school_id: @school.id)
  end

  def school_params
    params.require(:school).permit(:admin_id, :name, :email, :phone, :address, :about, :goal)
  end
end
