class Student::ReviewsController < Student::StudentBaseController
  before_action :set_current_student

  def index
    render :json => @current_student.reviews.map{ |review| get_review_json(review) }
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.student_account = @current_student

    if !@review.save
      raise "Review did not save correctly"
    else
      redirect_to "/student/reviews/submit"
    end
  end

  def show
  end

  private

  def review_params
    params.require(:review).permit(
      :company_id,
      :position_title,
      :salary,
      :projects,
      :mentorship,
      :number_interns,
      :net_promoter,
      :year,
      :season,
      :end,
      :hours
    )
  end

  def get_review_json(review)
    camelize_symbolize_keys({
      id: review.id,
      company_id: review.company_id,
      created_at: review.created_at,
      can_contact: true # TODO write this migration
    })
  end

end
