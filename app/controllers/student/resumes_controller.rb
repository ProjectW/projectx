class Student::ResumesController < Student::StudentBaseController
  before_action :get_current_student

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.student_account = @current_student

    if !@resume.save
      throw "Resume did not save correctly"
    end

    if @current_student.set_current_resume(@resume)
      redirect_to :student_dashboard
    else
      throw "Resume was not set as current"
    end
  end

  def show
    @resume = @current_student.resumes.find_by_id(params.fetch(:id))
    if @resume == nil
      render :status => 404
    elsif !@resume.upload.exists?
      throw "The resume with id #{@resume.id} does not exist"
    end

    send_file(
      @resume.upload.path,
      :filename => 'resume.pdf',
      :type => 'application/pdf',
      :disposition => 'inline')
  end

  def destroy
    @resume = @current_student.resumes.find_by_id(params.fetch(:id))
    if @resume == nil
      render :status => 404
    end
    @resume.upload.destroy
  end

  private

  def resume_params
    params.require(:resume).permit(:upload)
  end

end