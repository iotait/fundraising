class RegistrationsController < Devise::RegistrationsController
  
  def create
    super do
      resource.type = "Admin"
      resource.save
    end
  end

  protected

  def after_sign_up_path_for(resource)
    "/schools/new"
  end
end
