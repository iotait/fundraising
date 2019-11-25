class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_donations, only: [:show]

  # GET /students
  def index
    @students = Student.all
  end

  # GET /students/1
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    Student.create(student_params)
    redirect_to students_path
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
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
