class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def dashboard
  end

  protected

  def authenticate_admin!
    unless current_user.is_a?(Admin)
      redirect_to "/"
    end
  end
end
