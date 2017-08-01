class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    home_index_path
  end

  def configure_permitted_parameters
    added_attrs = [:user_name, :trainer, :admin, :email, :password, :password_confirmation, :remember_me, :current_password,]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
