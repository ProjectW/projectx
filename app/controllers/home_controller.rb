class HomeController < ApplicationController
  skip_before_action :authenticate_users!
  def index
  end
end
