class Student::StudentBaseController < ApplicationController
  layout "student/student_base"

  # TODO eventually for students, emails will be recycled 
  # ie Lisa Wang graduates and then Laquisha Wang comes to Harvard (both have same email)
  # we should make a new column or table to keep track of this and then
  # do devise lookups that way.
  before_action :authenticate_student_account!
  


  private

  def set_current_student
    @current_student = current_student_account
  end
end
