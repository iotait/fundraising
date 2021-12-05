require "securerandom"

class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :dashboard, :printable, :success]
  before_action :authenticate_teacher_or_admin!, only: [:new, :create, :import, :destroy, :printable]
  before_action :authenticate_user!, only: [:edit, :update, :dashboard]

  # GET /students/1
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "student",
               template: "students/pdf.html.erb",
               layout: "pdf.html",
               page_size: "Letter"
      end
    end
  end

  # GET /students/new
  def new
    @student = Student.new
    render "new", locals: {student: @student}
  end

  # GET /students/1/edit
  def edit
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream:
          turbo_stream.replace(
            :student_form,
            partial: "students/form",
            locals: {student: @student}
          )
      end
    end
  end

  # POST /students
  def create
    password = SecureRandom.hex(8)
    Student.create(student_params.merge(password: password, code: password))
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      @students = current_user.students
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream:
            turbo_stream.replace(:students, partial: "students/students")
        end
      end
    else
      render :edit
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to admin_dashboard_path(current_user)
  end

  def import
    begin
      Student.import(params[:file])
      flash[:success] = "Students imported!"
    rescue
      flash[:error] = "Sorry we failed to import all the students!"
    end
    redirect_to admin_dashboard_path(current_user)
  end

  def dashboard
  end

  def printable
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "student_printable.pdf",
               template: "students/printable.html.erb",
               layout: "pdf.html",
               page_size: "Letter"
      end
    end
  end

  def success
    flash[:success] = "Thank you for your donation"
    redirect_to student_path(@student)
  end

  private

  def set_student
    @student = if params[:student_id].blank?
      Student.find(params[:id])
    else
      Student.find(params[:student_id])
    end
  end

  def student_params
    params.require(:student).permit(:teacher_id, :first_name, :last_name, :email, :about, :password, :avatar)
  end
end
