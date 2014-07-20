class Student::ResumesController < Student::StudentBaseController
  before_action :get_current_student

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.student_account = @current_student
    @current_student.current_resume = @resume # FIXME old resume should not have nil student

    if @resume.save && @current_student.save
      redirect_to :student_dashboard
    else
      throw "error!"
    end
  end

  def show
    @resume = Resume.find(params.fetch(:id))
    
    if @resume.student_account_id != @current_student.id
      throw "Error: unauthorized id access"
    end

    send_file(@resume.upload.path, :filename => 'resume.pdf', :type => 'application/pdf', :disposition => 'inline')
  end

  private

  def resume_params
    params.require(:resume).permit(:upload)
  end

end
