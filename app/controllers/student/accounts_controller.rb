class Student::AccountsController < Student::StudentBaseController
  include Student::AngularHelper

  before_action :set_current_student
  around_action :with_render_exception

  VIEWS_LIMIT = 4

  def company_views
    views = CompanyProfileView.
      includes(:company).
      where(:student_account => @current_student).
      order(created_at: :desc).
      to_a.
      uniq(&:company_id).
      slice(0, VIEWS_LIMIT)
    render :json => camelize_symbolize_keys(views.map{ |view| get_view_json(view) })
  end

  def show
    render :json => camelize_symbolize_keys(get_account_json(@current_student))
  end

  private

  def get_account_json(account)
    {
      id: account.id,
      name: account.first_name + " " + account.last_name,
      graduation_year: account.graduation_year,
      school: account.school.display_name
    }
  end

  def get_view_json(view)
    {
      :company_id => view.company.id,
      :company_name => view.company.display_name
    }
  end

end
