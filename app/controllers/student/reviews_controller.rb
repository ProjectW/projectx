class Student::ReviewsController < Student::StudentBaseController
  # FIXME authenticate reviews again 
  # before_action :set_current_student
  skip_before_filter :authenticate_student_account!

  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if !@review.save
      raise "Review did not save correctly"
    else
      redirect_to "/about"
    end
  end

  def review_params
    params.require(:reviews).permit(:email, :first_name, :last_name, :company, :position_title)
  end

end
