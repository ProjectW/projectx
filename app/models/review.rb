class Review < ActiveRecord::Base
  belongs_to :student_account
  belongs_to :company

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true
  # validates :email, format: { with: /\A([^@\s]+)@college\.harvard\.edu\Z/i }
  validates :position_title, presence: true
  validates :company, presence: true
  validates :season, presence: true
  validates :year, presence: true
  # validates :net_promoter, presence: true
  # validates :hours, presence: true
  # validates :number_interns, presence: true, numericality: { only_integer: true }
  # validates :mentorship, presence: true
  # validates :projects, presence: true
  # validates :story, presence: true
  # validates :culture, presence: true

  after_create :notify_admin

  enum season: {
    spring: 1,
    summer: 2,
    fall: 3,
    winter: 4
  }

  private

  def notify_admin
    subject = "New review written by:" + self.student_account.email
    company = "Company: " + self.company.display_name
    review = self.to_json

    AdminMailer.
      raw_admin_email(subject, company + "\n" + review).
      deliver
  end

end
