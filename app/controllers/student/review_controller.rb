class Student::ReviewController < Student::StudentBaseController
  before_action :set_current_student

  def new
    @reviews = Review.new
  end

  def create
    @reviews = Review.new(review_params)

    if !@reviews.save
      raise "Review did not save correctly"
    else
      redirect_to :student_dashboard
    end
  end

  def review_params
    params.require(:reviews).permit(:email, :first_name, :last_name, :company, :position_title)
  end

end
