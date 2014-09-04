class Resume < ActiveRecord::Base
  belongs_to :student_account

  validates :student_account_id, presence: true

  # https://github.com/thoughtbot/paperclip
  PATH_TO_RESUME = '/resumes/account:student_account_id/:style:updated_at.:extension'
  has_attached_file :upload, {
    :preserve_files => 'true',
    :url => PATH_TO_RESUME,
    :path => ':rails_root/tmp' + PATH_TO_RESUME
  }
  validates_attachment_content_type :upload, :content_type => ['application/pdf', 'application/x-pdf']

  def current?
    self.student_account.current_resume == self
  end

  def dir_path
    Resume.resumes_root_path.join('account' + self.student_account_id.to_s)
  end

  def dir_exist?
    File.directory?(dir_path)
  end

  def mkdir
    Dir.mkdir(dir_path)
  end

  def self.resumes_root_path
    # this needs to be somewhere permanent - maybe change it in environment.rb
    Rails.root.join('tmp', 'resumes')
  end

end
