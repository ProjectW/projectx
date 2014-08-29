class Student::StudentDashboardController < Student::StudentBaseController
  def show
    render layout: 'angular', title: 'Dashboard'
  end
end
