require "securerandom"

class TeachersController < ApplicationController
  before_action :set_teacher, only: [:edit, :update, :destroy, :dashboard, :add_reading_session_for_class, :students, :promote, :class_printable, :printable]
  before_action :authenticate_admin!, only: [:new, :create, :import, :destroy]
  before_action :authenticate_teacher_or_admin!, only: [:edit, :update, :dashboard, :add_reading_session_for_class, :students, :dashboard, :promote]

  # GET /teachers/new
  def new
    @teacher = Teacher.new
    render "new", locals: {teacher: @teacher}
  end

  # GET /teachers/1/edit
  def edit
    render "edit", locals: {teacher: @teacher}
  end

  # POST /teachers
  def create
    password = SecureRandom.hex(8)
    Teacher.create(teacher_params.merge(school: current_user.school, password: password, code: password))
    redirect_to admin_teachers_path(current_user)
  end

  # PATCH/PUT /teachers/1
  def update
    if @teacher.update(teacher_params)
      redirect_to admin_dashboard_path(current_user)
    else
      render :edit
    end
  end

  # DELETE /teachers/1
  def destroy
    @teacher.destroy
    redirect_to admin_dashboard_path(current_user)
  end

  def import
    begin
      Teacher.import(params[:file], current_user.school.id)
      flash[:success] = "Teachers imported!"
    rescue
      flash[:error] = "Sorry we failed to import all the teachers!"
    end
    redirect_to admin_dashboard_path(current_user)
  end

  def dashboard
  end

  def promote
  end

  def students
    students_search = params[:search]

    if students_search.blank?
      @students = @teacher.students
    elsif !students_search.nil?
      begin
        @students = if students_search.numeric?
          Array(@teacher.students.find(students_search))
        else
          @teacher.search_students(students_search)
        end
      rescue
        flash.now[:error] = "It appears there was an error in the name you were searching"
      end

      if @students.nil?
        flash.now[:error] = "No students match that name"
      end
    end
  end

  # TODO security revisit CSRF protection here
  skip_before_action :verify_authenticity_token, raise: false
  def add_reading_session_for_class
    @teacher.add_reading_session_for_class(params[:time], params[:student_ids])
  end

  def class_printable
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "class_printable.pdf",
               template: "teachers/class_printable.html.erb",
               layout: "pdf.html",
               page_size: "Letter"
      end
    end
  end

  def printable
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "teacher_printable.pdf",
               template: "teachers/printable.html.erb",
               layout: "pdf.html",
               page_size: "Letter"
      end
    end
  end

  private

  def set_teacher
    @teacher = if params[:teacher_id].blank?
      Teacher.find(params[:id])
    else
      Teacher.find(params[:teacher_id])
    end
  end

  def teacher_params
    params.require(:teacher).permit(:school_id, :first_name, :last_name, :email, :search)
  end
end
