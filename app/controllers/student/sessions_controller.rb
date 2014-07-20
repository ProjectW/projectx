class Student::SessionsController < Devise::SessionsController

  def create
    params[:student_account].merge!(:remember_me => 1) # always remember
    super
  end

end
