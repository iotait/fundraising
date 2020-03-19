class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]

  # GET /schools/1
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
    render "new", locals: {school: @school}
  end

  # GET /schools/1/edit
  def edit
    render "edit", locals: {school: @school}
  end

  # POST /schools
  def create
    School.create(school_params.merge(admin: current_user))
    redirect_to admin_dashboard_path(current_user)
  end

  # PATCH/PUT /schools/1
  def update
    if @school.update(school_params)
      redirect_to school_path
    else
      render :edit
    end
  end

  # DELETE /schools/1
  def destroy
    @school.destroy
    redirect_to admin_dashboard_path(current_user)
  end

  def cancel
  end

  def success
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:admin_id, :name, :goal, :about, :avatar)
  end
end
