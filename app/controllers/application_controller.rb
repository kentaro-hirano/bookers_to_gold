class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
      added_attrs = [:user_name, :email, :password, :password_confirmation, :remember_me, :postcode, :prefecture_code, :address_city, :address_street, :address_building]
      
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
    def after_sign_in_path_for(resource)
      user_path(resource)
    end
    
end
