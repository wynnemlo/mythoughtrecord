class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    root_path
  end

  def access_denied
    flash['error'] = "You do not have sufficient permissions."
    redirect_to thoughtrecords_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :time_zone
    devise_parameter_sanitizer.for(:account_update) << :time_zone
  end

end
