class StudentsController < ApplicationController
  before_action :set_student, only: [:show]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    Student.create(student_params)
    redirect_to students_path
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:id, :school_id, :teacher_id, :name, :goal)
  end
end
