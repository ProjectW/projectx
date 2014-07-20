class Resume < ActiveRecord::Base
  belongs_to :student_account

  validates :student_account_id, presence: true

  def dir_path
    Resume.resumes_root_path.join('account_' + self.student_account_id.to_s)
  end

  def dir_exist?
    File.directory?(dir_path)
  end

  def mkdir
    Dir.mkdir(dir_path)
  end

  def file_path
    self.dir_path.join('resume_' + self.id) # .pdf?
  end

  def exist?
    File.file?(file_path)
  end

  def self.resumes_root_path
    # this needs to be somewhere permanent - maybe change it in environment.rb
    Rails.root.join('tmp', 'resumes')
  end

end
