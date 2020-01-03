class TeachersController < ApplicationController
  before_action :set_teacher, only: [:edit, :update, :destroy, :dashboard]
  protect_from_forgery with: :null_session

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  def create
    Teacher.create(teacher_params.merge(school: current_user.school))
    redirect_to "/"
  end

  # PATCH/PUT /teachers/1
  def update
    if @teacher.update(teachers_path)
      redirect_to "/"
    else
      render :edit
    end
  end

  # DELETE /teachers/1
  def destroy
    @teacher.destroy
    redirect_to "/"
  end

  def import
    Teacher.import(params[:file], current_user.school.id)
    redirect_to "/"
  end

  def dashboard
  end

  def add_reading_session_for_class
    Teacher.add_reading_session_for_class(params[:time], params[:student_ids].split(","))
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:school_id, :first_name, :last_name, :email)
  end
end
