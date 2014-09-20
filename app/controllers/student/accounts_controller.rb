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
      select('DISTINCT company_id').
      limit(VIEWS_LIMIT)
    render :json => camelize_symbolize_keys(views.map{ |view| get_view_json(view) })
  end

  private

  def get_view_json(view)
    {
      :company_id => view.company.id,
      :company_name => view.company.display_name
    }
  end

end
