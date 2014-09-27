class HomeController < ApplicationController
  layout 'parallax', :only => [:index, :about_us]

  def index
    if student_account_signed_in?
      redirect_to '/student/dashboard' # TODO put into variable
    end
  end

  def privacy
  end

end
