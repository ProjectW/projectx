class Student::CompaniesController < Student::StudentBaseController
  include Shared::AngularHelper

  before_action :set_current_student
  before_action :set_current_company, only: [:reviews, :show, :watch, :view]
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
    reviews = Review.
                includes(student_account: [:school]).
                where(:company_id => @company.id).
                order(created_at: :desc).
                map{ |review| get_review_json(review) }

    render :json => camelize_symbolize_keys(reviews)
  end

  def search
    search_text = params[:searchText]
    companies = Company.where('display_name LIKE ?', '%' + search_text + '%')

    CompanySearchTerm.create(:student_account => @current_student, :term => search_text)

    companies_json = companies.map{|company| get_company_json(company) }

    if params[:sort]
      companies_json = companies_json.sort_by{ |co| co[:name] }
    end

    # Optimize N + 1 queries now
    render :json => camelize_symbolize_keys(companies_json)
  end

  def most_reviewed
    render :json => camelize_symbolize_keys(Company.most_reviewed.map{ |c| get_company_json(c) })
  end

  def most_viewed
    render :json => camelize_symbolize_keys(Company.most_viewed.map{ |c| get_company_views_json(c) })
  end

  def view
    if not CompanyProfileView.create(company_id: @company.id, student_account_id: @current_student.id)
      raise "Error saving profile view"
    end

    render_success
  end

  def watch
    with_standard_render do
      watching = params.fetch(:watching)
      @company.watch(@current_student.id, watching)
      { watching: watching }
    end
  end

  def show
    render :json => camelize_symbolize_keys(get_company_json(@company, true))
  end

  private

  def set_current_company
    @company = Company.find(params.fetch(:id))
  end

  def get_review_json(review)
    review.
      as_json(:only => [:id, :created_at, :number_interns, :number_hours, :location, :position_title, :year, :recommend, :salary]).
      merge({
        season: review.season.capitalize,
        student: {
          name: review.student_account.first_name + " " + review.student_account.last_name,
          school: review.student_account.school.display_name,
          graduation_year: review.student_account.graduation_year
        }
      })
  end

  def get_company_views_json(company)
    {
      id: company.id,
      name: company.display_name,
      views_count: company.views.count
    }
  end

  def get_company_json(company, watching = false)
    res = {
      id: company.id,
      name: company.display_name,
      url: company.url,
      reviews_count: company.reviews.count}

    watching ? res.merge({ watching: company.watching?(@current_student.id) }) : res
  end

end
