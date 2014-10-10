class Resume < ActiveRecord::Base
  require 'zip'

  ZIP_BASE_PATH = Rails.env.production? ? '/var/pinpeg' : File.join(Rails.root, 'tmp')

  belongs_to :student_account

  validates :student_account_id, presence: true

  # https://github.com/thoughtbot/paperclip
  PATH_TO_RESUME = '/resumes/account:student_account_id/:style:updated_at.:extension'
  BASE_PATH = Rails.env.production? ? '/var/pinpeg' : ':rails_root/tmp'

  has_attached_file :upload, {
    :preserve_files => 'true',
    :url => PATH_TO_RESUME,
    :path => BASE_PATH + PATH_TO_RESUME
  }
  validates_attachment_content_type :upload, :content_type => ['application/pdf', 'application/x-pdf']

  def current?
    self.student_account.current_resume == self
  end

  def self.make_zip(name = nil, resumes = nil)
    name = "resumes" if !name
    zip_path = File.join(ZIP_BASE_PATH, "zip", name + Time.now.to_i.to_s) + ".zip"

    if !resumes
      current_resume_ids = StudentAccount.select(:current_resume_id).all.map(&:current_resume_id)
      resumes = Resume.find(current_resume_ids)
    end

    files = resumes.map{ |resume| resume.upload.path }

    Zip::File.open(zip_path, Zip::File::CREATE) do |zipfile|
      files.each do |file_to_be_zipped|

        if File.directory?(file_to_be_zipped)
          directory = file_to_be_zipped
          puts "zipper: archiving directory: #{directory}"
          File.dirname(directory)
          directory_pathname = Pathname.new(directory_chosen_pathname)
          Dir[File.join(directory, '**', '**')].each do |file|
            file_pathname = Pathname.new(file)
            file_relative_pathname = file_pathname.relative_path_from(directory_pathname)
            zipfile.add(file_relative_pathname,file)
          end
          next
        end

        filename = File.basename(file_to_be_zipped)

        puts "zipper: archiving #{file_to_be_zipped} as #{filename} into #{zipfile}"

        zipfile.add(filename,file_to_be_zipped)
      end
    end

    zip_path
  end
end
