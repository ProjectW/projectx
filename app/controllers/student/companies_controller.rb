class Student::CompaniesController < Student::StudentBaseController
  include Student::AngularHelper

  before_action :set_current_student

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
    @company = Company.find(params.fetch(:id))

    render :json => [
      {
        :id => 1,
        :text => 'hello testing 1'
      },
      {
        :id => 2,
        :text => 'hello testing 2'
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
    
  end
end
