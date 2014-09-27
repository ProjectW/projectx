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

  def info
    if !@current_student.update_attributes(update_params)
      raise "Unable to save"
    end

    render :json => get_account_json(@current_student)
  end

  private

  def update_params
    params_to_keep = [:firstName, :lastName, :graduationYear]
    snakefy_symbolize_keys(params.symbolize_keys.keep_if{ |key, value| params_to_keep.include?(key) })
  end

  def get_account_json(account)
    {
      first_name: account.first_name,
      last_name: account.last_name,
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
