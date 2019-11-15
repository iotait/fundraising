class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show]

  def index
    @teachers = Teacher.all
    render :index
  end

  def show
  end

  def new
    @teacher = Teacher.new
    render :new
  end

  def create
    Teacher.create(teacher_params)
    redirect_to teachers_path
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:school_id, :name, :email, :phone, :goal)
  end
end
