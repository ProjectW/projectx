class Review < ActiveRecord::Base
  RECENT_LIMIT = 50

  belongs_to :student_account
  belongs_to :company

  validates :position_title, presence: true
  validates :company, presence: true
  validates :season, presence: true
  validates :year, presence: true

  after_create :notify_admin

  enum season: {
    spring: 1,
    summer: 2,
    fall: 3,
    winter: 4
  }

  def self.recent(limit = RECENT_LIMIT)
    Review.order(:created_at => :desc).limit(limit)
  end

  def reviewed?
    self.projects.present? ||
    self.mentorship.present? ||
    self.story.present? ||
    self.culture.present? ||
    self.extra.present?
  end

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
