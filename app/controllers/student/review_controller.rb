class Student::ReviewController < Student::StudentBaseController
  before_action :set_current_student

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if !@review.save
      raise "Review did not save correctly"
    else
      redirect_to :sign_in
    end
  end

  def review_params
    params.require(:review).permit(:email, :first_name, :last_name, :company, :position_title)
  end

end
