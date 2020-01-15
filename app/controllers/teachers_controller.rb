class TeachersController < ApplicationController
  before_action :set_teacher, only: [:edit, :update, :destroy, :dashboard, :add_reading_session_for_class]
  before_action :authenticate_admin!, only: [:new, :create, :import, :destroy]
  before_action :authenticate_teacher_or_admin!, only: [:edit, :update, :dashboard, :add_reading_session_for_class]

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
    Teacher.create(teacher_params.merge(school: current_user.school))
    redirect_to admin_dashboard_path(current_user)
  end

  # PATCH/PUT /teachers/1
  def update
    if @teacher.update(teachers_path)
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
    Teacher.import(params[:file], current_user.school.id)
    redirect_to admin_dashboard_path(current_user)
  end

  def dashboard
  end

  # TODO security revisit CSRF protection here
  skip_before_action :verify_authenticity_token
  def add_reading_session_for_class
    @teacher.add_reading_session_for_class(params[:time], params[:student_ids])
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
    params.require(:teacher).permit(:school_id, :first_name, :last_name, :email)
  end
end
