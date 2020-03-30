require "securerandom"

class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :dashboard, :printable]
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
    render "edit", locals: {student: @student}
  end

  # POST /students
  def create
    password = SecureRandom.hex(8)
    Student.create(student_params.merge(password: password, code: password))
    redirect_to admin_dashboard_path(current_user)
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      redirect_to "/" + current_user.type.downcase.pluralize + "/" + current_user.id.to_s + "/dashboard"
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

  def cancel
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
