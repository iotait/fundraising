class AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin

  def dashboard
  end

  def end_read_a_thon
  end

  def promote
  end

  def reports
  end

  def school
  end

  def students_csv
  end

  def students
    # TODO BUG: flash messages no longer show
    begin
      @students = @admin.search_students(params[:search])
    rescue
      # flash[:error] = "It appears there was an error in the name you were searching"
    end

    if @students.nil?
      # flash[:error] = "No students match that name"
    end
  end

  def teacher_id_pdf
    render pdf: "teacher",
           template: "admins/teacher_id_pdf.html.erb",
           layout: "pdf.html",
           page_size: "Letter"
  end

  def teachers_csv
  end

  def teachers
    # TODO BUG: flash messages no longer show
    begin
      @teachers = @admin.search_teachers(params[:search])
    rescue
      flash[:error] = "It appears there was an error in the name you were searching"
    end

    if @teachers.nil?
      flash[:error] = "No teachers match that name"
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:admin_id])
  end
end
