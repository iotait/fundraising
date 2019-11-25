class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :set_students, only: [:show]

  # GET /teachers
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  def create
    Teacher.create(teacher_params)
    redirect_to teachers_path
  end

   # PATCH/PUT /teachers/1
   def update
    if @teacher.update(teachers_path)
      redirect_to teachers_path
    else
      render :edit
    end
  end

  # DELETE /teachers/1
  def destroy
    @teacher.destroy
    redirect_to teachers_path
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def set_students
    @students = Student.where(teacher_id: @teacher.id)
  end

  def teacher_params
    params.require(:teacher).permit(:school_id, :first_name, :last_name, :email, :phone, :goal)
  end
end
