class Student::SessionsController < Devise::SessionsController

  def create
    params[:student_account]
    puts 'hi'
    super
  end

end
