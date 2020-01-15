class ReadingSessionsController < ApplicationController
  before_action :set_reading_session, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @reading_session = ReadingSession.new
    @student = Student.where(id: params[:student_id]).first
    render "new", locals: {student: @student, session: @reading_session}
  end

  def edit
    @student = Student.where(id: params[:student_id]).first
    render "edit", locals: {student: @student, session: @reading_session}
  end

  def create
    ReadingSession.create(reading_session_params.merge(student_id: params[:student_id]))
    redirect_to "/" + current_user.type.downcase.pluralize + "/" + current_user.id.to_s + "/dashboard"
  end

  def update
    if @reading_session.update(reading_session_params)
      redirect_to "/" + current_user.type.downcase.pluralize + "/" + current_user.id.to_s + "/dashboard"
    else
      render :edit
    end
  end

  def destroy
    @reading_session.destroy
    redirect_to "/" + current_user.type.downcase.pluralize + "/" + current_user.id.to_s + "/dashboard"
  end

  private

  def set_reading_session
    @reading_session = ReadingSession.find(params[:id])
  end

  def reading_session_params
    params.require(:reading_session).permit(:student_id, :time)
  end
end
