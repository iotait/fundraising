class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:type, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :goal, :about, :school_id, :teacher_id]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    "/" + current_user.type.downcase.pluralize + "/" + current_user.id.to_s + "/dashboard"
  end

  def authenticate_admin!
    unless current_user.is_a?(Admin)
      flash[:error] = "Sorry, you must be signed in as an admin to view that."
      redirect_to "/"
    end
  end
end
