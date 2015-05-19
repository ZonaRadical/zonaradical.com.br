class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  
  respond_to :html, :json

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :surname)
  end
end
