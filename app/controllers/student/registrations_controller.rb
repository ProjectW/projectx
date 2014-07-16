class Student::RegistrationsController < Devise::RegistrationsController
  before_action :update_sanitized_params

  protected 
  
  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up).push(:full_name, :school, :graduation_year)
  end

end