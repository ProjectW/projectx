class Student::ReviewsController < Student::StudentBaseController
  include Student::AngularHelper

  before_action :set_current_student
  around_action :with_render_exception, :only => [:index, :update]

  def index
    render :json => @current_student.reviews.map{ |review| get_review_json(review) }
  end

  def create
    to_save = review_params.keep_if{ |key, value| Review.attribute_names.include?(key.to_s) }
    @review = Review.new(to_save)

    @review.student_account = @current_student

    if !@review.save
      raise "Review did not save correctly"
    else
      render_success
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.student_account != @current_student
      raise "Unauthorized, review not owned by student id: #{current_student.id}"
    end

    @review.contactable = params[:contactable]

    if !@review.save
      raise 'Could not save review'
    end

    render :json => get_review_json(@review)
  end

  private

  def review_params
    params.require(:review).permit(
      :companyId,
      :positionTitle,
      :salary,
      :projects,
      :mentorship,
      :numberInterns,
      :numberHours,
      :year,
      :season,
      :recommend,
      :story,
      :culture,
      :location,
      :extra
    )
    snakefy_symbolize_keys(params)
  end

  def get_review_json(review)
    camelize_symbolize_keys({
      id: review.id,
      company_id: review.company_id,
      company_name: review.company.display_name,
      created_at: review.created_at,
      contactable: review.contactable
    })
  end

end
