class Admin::AdminBaseController < ApplicationController
  layout "angular"

  before_action :authenticate_student_account!
  before_action :authenticate_admin_account!

  private

  def authenticate_admin_account!
    account = current_student_account
    if !StudentAccount.get_admins.include?(account)
      redirect_to root_path
    else
      @current_admin = account
    end
  end

end
