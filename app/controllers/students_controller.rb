class StudentsController < ApplicationController
  before_action :set_student, only: [:show]
  before_action :set_donations, only: [:show]

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

  def set_donations
    @donations = Donation.where(student_id: @student.id)
  end

  def student_params
    params.require(:student).permit(:teacher_id, :first_name, :last_name, :email, :about, :goal)
  end
end
