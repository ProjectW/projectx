class Student::CompanyProfileController < Student::StudentBaseController
  def show
    render layout: 'angular'
  end
end
