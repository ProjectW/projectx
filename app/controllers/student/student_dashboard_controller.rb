class Student::StudentDashboardController < Student::StudentBaseController
  def show
    render layout: 'angular'
  end
end
