class Admin::AdminAppController < Admin::AdminBaseController
  def index
  end

  def all_resumes
    send_file(Resume.make_zip(nil, Resume.current_resumes))
  end

  def current_resumes
    send_file(Resume.make_zip)
  end
end
