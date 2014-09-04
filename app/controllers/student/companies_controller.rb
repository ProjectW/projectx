class Student::CompaniesController < Student::StudentBaseController
  include Student::AngularHelper

  before_action :set_current_student
  before_action :set_current_company, only: [:reviews, :show]

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

      # render :json => {
      #   # :id => 2,
      #   :name => "Hello my name is willy"
      # }
    render :json => [
      {
        :id => 1,
        :name => 'hello testing 1'
      },
      {
        :id => 2,
        :name => 'hello testing 2'
      }
    ]
    # render :json =>
    #   camelize_symbolize_keys(@company.reviews.map do |review|
    #                             {
    #                               id: review.id
    #                             }
    #                           end
    #   )
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
