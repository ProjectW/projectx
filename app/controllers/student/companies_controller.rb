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
    byebug
    @company = Company.find(params.fetch(:id))

    render :json =>
      camelize_symbolize_keys(@company.reviews.map do |review|
                                {
                                  id: review.id
                                }
                              end
      )
  end

  def show
    
  end
end
