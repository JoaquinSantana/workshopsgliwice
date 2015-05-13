class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:danger] = 'Resource not found.'
    redirect_back_or root_path
  end



  protect_from_forgery with: :exception
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { 
      |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation)
    }    
    devise_parameter_sanitizer.for(:account_update) { 
      |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation)
    }
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end
end
