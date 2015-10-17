class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def after_update_path_for(resource)
      user_path(resource)
    end

    def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u|
        u.permit(:nome, :email, :password, :password_confirmation, :current_password)
      }
      devise_parameter_sanitizer.for(:account_update) { |u|
        u.permit(:nome, :email, :password, :password_confirmation, :current_password)
      }
  end
end