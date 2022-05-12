class ApplicationController < ActionController::Base
  protected

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    elsif resource_class ==AdminUser
      AdminUser::ParameterSanitizer.new(AdminUser, :admin_user, params)
    else
      super # Use the default one
    end
  end
end
