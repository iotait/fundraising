class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :dashboard]
  before_action :authenticate_admin!, only: [:new, :create, :import]

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
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    Student.create(student_params) # .merge(school: current_user.school)
    redirect_to admin_dashboard_path(current_user)
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

  private

  def set_student
    if params[:student_id].blank?
      @student = Student.find(params[:id])
    else
      @student = Student.find(params[:student_id])
    end
  end

  def student_params
    params.require(:student).permit(:teacher_id, :first_name, :last_name, :email, :about, :password)
  end
end
