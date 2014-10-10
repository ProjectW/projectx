class Student::ResumesController < Student::StudentBaseController
  include Shared::AngularHelper

  before_action :set_current_student
  before_action :set_resume_from_id, only: [:show, :destroy]

  def index
    render :json => @current_student.undeleted_resumes.map{ |resume| get_resume_json(resume) }
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
    respond_with_resume_if_exists(@resume)
  end

  def current
    resume = @current_student.current_resume

    if resume.nil? || resume.deleted
      render :json => { id: nil }
    else
      respond_with_resume_if_exists(resume)
    end
  end

  def destroy
    # TODO destroy in resumes controller
    # @resume.upload.destroy
    # @resume.deleted = true
    # @resume.save
  end

  private

  def set_resume_from_id
    @resume = @current_student.resumes.find_by_id(params.fetch(:id))
    if @resume.nil? || @resume.deleted
      render :status => 404
      return false
    end
  end

  def resume_params
    params.require(:resume).permit(:upload)
  end

  def respond_with_resume_if_exists(resume)
    # should not trigger unless db is messed up
    raise "The resume with id #{@resume.id} does not exist" unless resume.upload.exists?

    respond_to do |format|
      format.pdf { show_resume_file(resume) }
      format.all { render :json => get_resume_json(resume) }
    end
  end

  def show_resume_file(resume)
    send_file(
      resume.upload.path,
      :filename => resume.upload_file_name,
      :type => 'application/pdf',
      :disposition => 'inline')
  end

  def get_resume_json(resume)
    camelize_symbolize_keys({
      id: resume.id,
      upload_file_name: resume.upload_file_name,
      updated_at: resume.updated_at
    })
  end
end
