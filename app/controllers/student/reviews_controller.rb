class Student::ReviewsController < Student::StudentBaseController
  before_action :set_current_student

  def index
    render :json => []
  end

  def new
    @review = Review.new
  end

  def create
    `echo 'review submitted' | sendmail -t willyxiao@gmail.com`
    @review = Review.new(review_params)

    if !@review.save
      raise "Review did not save correctly"
    else
      redirect_to "/student/reviews/submit"
    end
  end

  def show
  end

  def review_params
    params.require(:reviews).permit(
      :email, 
      :first_name, 
      :last_name, 
      :company, 
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

end
