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
    reviews = Review.includes(student_account: [:school]).where(:company_id => @company.id).map do |review|
      {
        id: review.id,
        student: {
          name: review.student_account.first_name + " " + review.student_account.last_name,
          school: review.student_account.school.display_name,
          graduation_year: review.student_account.graduation_year
        }
      }
    end

    render :json => camelize_symbolize_keys(reviews)
  end

  def search
    search_text = params[:searchText]
    companies = Company.where('display_name LIKE ?', '%' + search_text + '%')

    # Optimize N + 1 queries now
    render :json => camelize_symbolize_keys(companies.map{|company| get_company_json(company) })
  end

  def view
    company_id = params[:id]
    if not CompanyProfileView.create(company_id: company_id, student_account_id: @current_student.id)
      raise "Error saving profile view"
    else
      render_success
    end

  end

  def show
    render :json => camelize_symbolize_keys(get_company_json(@company))
  end

  private

  def set_current_company
    @company = Company.find(params.fetch(:id))
  end

  def get_company_json(company)
    {
      id: company.id,
      name: company.display_name,
      url: company.url,
      reviews_count: company.reviews.count
    }
  end

end
