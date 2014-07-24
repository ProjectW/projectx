class Student::RegistrationsController < Devise::RegistrationsController
  layout "student"
  before_action :update_sanitized_params

  def destroy
    throw "Can't delete student accounts"
  end

  protected 
  
  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name, :school_id, :graduation_year)
  end

end
