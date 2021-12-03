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

  def student_search
    students_search = params["search_term"]

    if students_search.blank?
      @students = @admin.students
    elsif students_search.present?
      begin
        @students = if students_search.numeric?
          Array(@admin.students.find(students_search))
        else
          @admin.search_students(students_search)
        end
      rescue
        flash.now[:error] = "It appears there was an error in the name you were searching"
      end

      if @students.nil?
        flash.now[:error] = "No students match that name"
      end

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(:students, partial: "students/students")
        end
      end
    end
  end

  def students
    @students = @admin.students
  end

  def teacher_id_pdf
    render pdf: "teacher",
           template: "admins/teacher_id_pdf.html.erb",
           layout: "pdf.html",
           page_size: "Letter"
  end

  def teacher_printable
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "teacher_printable.pdf",
               template: "admins/teacher_printable.html.erb",
               layout: "pdf.html",
               page_size: "Letter"
      end
    end
  end

  def teachers_csv
  end

  def teachers
    teachers_search = params[:teachers_search]

    if teachers_search.blank?
      @teachers = @admin.teachers
    elsif teachers_search.present?
      begin
        @teachers = if teachers_search.numeric?
          Array(@admin.teachers.find(teachers_search))
        else
          @admin.search_teachers(teachers_search)
        end
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
    @admin = current_user
  end
end
