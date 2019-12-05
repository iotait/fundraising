class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :import]

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
    Student.create(student_params) # .merge(school: current_user.school)
    redirect_to "/"
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      redirect_to "/"
    else
      render :edit
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to "/"
  end

  def import
    Student.import(params[:file])
    redirect_to "/"
  end

  def dashboard
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:teacher_id, :first_name, :last_name, :email, :about, :password, :mins_read)
  end
end
