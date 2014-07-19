class Student::StudentBaseController < ApplicationController
  # TODO eventually for students, emails will be recycled 
  # ie Lisa Wang graduates and then Laquisha Wang comes to Harvard
  # we should make a new column or table to keep track of this and then
  # do devise lookups that way.

  # before_action :authenticate_student_account!
  layout "student"

  def index
  end
end