class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    Student.create(student_params)
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:id, :name, :goal)
  end
end
