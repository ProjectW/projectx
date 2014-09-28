class HomeController < ApplicationController
  layout 'parallax', :only => [:index, :about_us]

  def index
    if student_account_signed_in?
      redirect_to '/student/dashboard' # TODO put into variable
    end
  end

  def privacy
  end

  def get_contact
    render 'contact'
  end

  def post_contact
    email = params.fetch(:email)
    message = params.fetch(:message)

    AdminMailer.contact_us(email, message).deliver

    redirect_to "/"
  end

  def partners
  end

  def about
  end
end
