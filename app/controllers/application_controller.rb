class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # leads to the splash page after sign out, splash path
  def after_sign_out_path_for(_resource_or_scope)
    splash_path
    destroy_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
  end
end
