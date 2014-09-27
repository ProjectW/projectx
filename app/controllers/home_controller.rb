class HomeController < ApplicationController
  def index
    if student_account_signed_in?
      redirect_to '/student/dashboard' # TODO put into variable
    end
  end

  def create
    redirect_to :student_login
  end
end
