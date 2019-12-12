class ReadingSessionsController < ApplicationController
  before_action :set_reading_session, only: [:edit, :update, :destroy]
  
  def new
    @reading_session = ReadingSession.new
  end

  def edit
  end
  
  def create
    ReadingSession.create(reading_session_params)
  end

  def update
    if @reading_session.update(reading_session_params)
    else
      render :edit
    end
  end

  def destroy
    @reading_session.destroy
  end

  private

  def set_reading_session
    @reading_session = ReadingSession.find(params[:id])
  end

  def reading_session_params
    params.require(:reading_session).permit(:student_id, :time)
  end
end