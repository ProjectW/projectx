class Company::CompanyDashboardController < Company::CompanyBaseController
  def show
  end

  def post
    firstName = params.fetch(:firstName)
    lastName = params.fetch(:lastName)
    email = params.fetch(:email)
    cName = params.fetch(:cName)
    cURL = params.fetch(:cURL)

    AdminMailer.recruiter_email(firstName, lastName, email, cName, cURL).deliver

    redirect_to "/"
  end

end
