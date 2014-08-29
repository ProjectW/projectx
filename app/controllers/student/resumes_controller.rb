class Student::ResumesController < Student::StudentBaseController
  before_action :set_current_student

  def index
    render :json => [
      {
        :id => 1,
        :name => 'resume1', 
        :path => ActionController::Base.helpers.asset_path('city2.jpg'),
      },
      {
        :id => 2,
        :name => 'zresume2',
        :path => ActionController::Base.helpers.asset_path('profile.png')
      }
    ]
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.student_account = @current_student

    if !@resume.save
      raise "Resume did not save correctly"
    end

    if @current_student.set_current_resume!(@resume)
      redirect_to :student_dashboard
    else
      raise "Resume was not set as current"
    end
  end

  def show
    @resume = @current_student.resumes.find_by_id(params.fetch(:id))
    
    render :status => 404 unless @resume
    raise "The resume with id #{@resume.id} does not exist" unless @resume.upload.exists?

    send_file(
      @resume.upload.path,
      :filename => 'resume.pdf',
      :type => 'application/pdf',
      :disposition => 'inline')
  end

  def destroy
    @resume = @current_student.resumes.find_by_id(params.fetch(:id))
    render :status => 404 unless @resume
    @resume.upload.destroy
  end

  private

  def resume_params
    params.require(:resume).permit(:upload)
  end

end
