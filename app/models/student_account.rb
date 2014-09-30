class StudentAccount < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable

  has_many :resumes
  has_many :reviews
  has_one :attribute_list, :class_name => "StudentAttributeList"
  belongs_to :school
  belongs_to :current_resume, :class_name => "Resume"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@college\.harvard\.edu\Z/i }
  validates :school_id, presence: true
  validates :graduation_year, presence: true

  after_create :notify_admin

  def set_current_resume!(resume)
    if resume.student_account_id != self.id 
      raise 'Resume does not belong to current student account'
    end

    self.current_resume = resume
    self.save
  end

  # TODO rollback_current_resume
  # def rollback_current_resume
  #   self.undeleted_resumes.
  # end

  def undeleted_resumes
    self.resumes.where( deleted: false )
  end

  private

  def notify_admin
    subject = "New account created by: " + self.email
    name = "Name: " + self.first_name + " " + self.last_name
    year = "Graduation Year: " + self.graduation_year.to_s

    AdminMailer.
      raw_admin_email(subject, name + "\n" + year).
      deliver
  end

end
