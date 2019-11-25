class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  before_action :set_teachers, only: [:show]

  # GET /schools
  def index
    @schools = School.all
  end

  # GET /schools/1
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  def create
    School.create(school_params)
    redirect_to schools_path
  end

  # PATCH/PUT /schools/1
  def update
    if @school.update(schools_path)
      redirect_to schools_path
    else
      render :edit
    end
  end

  # DELETE /schools/1
  def destroy
    @school.destroy
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
