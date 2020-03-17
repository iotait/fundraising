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
    if params[:students_search] != nil
      begin
        @students = @admin.search_students(params[:students_search])
      rescue
        flash.now[:error] = "It appears there was an error in the name you were searching"
      end
  
      if @students.nil?
        flash.now[:error] = "No students match that name"
      end
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
    if params[:teachers_search] != nil
      begin
        @teachers = @admin.search_teachers(params[:teachers_search])
      rescue
        flash.now[:error] = "It appears there was an error in the name you were searching"
      end

      if @teachers.nil?
        flash.now[:error] = "No teachers match that name"
      end
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:admin_id])
  end
end
