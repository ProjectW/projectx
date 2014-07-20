class Student::ResumesController < Student::StudentBaseController
  before_action :get_current_student

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.student_account = @current_student
    @current_student.current_resume = @resume

    if @resume.save && @current_student.save
      redirect_to :student_dashboard
    else
      throw "error!"
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:upload)
  end

end
