class HomeController < ApplicationController
  def index
  end

  def create
    redirect_to :student_login
  end
end
