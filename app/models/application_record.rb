class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :full_name, :address, :phone_number ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :full_name, :address, :phone_number ])
  end

  def require_admin
    unless current_user&.roles&.pluck(:name)&.include?("admin")
      redirect_to root_path, alert: "Access denied."
    end
  end
end
