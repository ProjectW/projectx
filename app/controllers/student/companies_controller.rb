class Student::CompaniesController < Student::StudentBaseController
  include Student::AngularHelper

  before_action :set_current_student
  before_action :set_current_company, only: [:reviews, :show]
  around_action :with_render_exception

  def index
    render :json =>
      camelize_symbolize_keys(@company.map do |resume|
                                {
                                  id: company.id
                                }
                              end
      )
  end

  def reviews
    render :json =>
      camelize_symbolize_keys(@company.reviews.map do |review|
                                {
                                  id: review.id
                                }
                              end
      )
  end

  def search
    search_text = params.get(:searchText)
  end

  def show
    render :json => get_company_json(@company)
  end

  private

  def set_current_company
    @company = Company.find(params.fetch(:id))
  end

  def get_company_json(company)
    {
      id: company.id,
      name: company.display_name
    }
  end

end
