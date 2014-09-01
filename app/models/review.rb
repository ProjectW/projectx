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
  validates :net_promoter, presence: true
  validates :hours, presence: true
  validates :number_interns, presence: true, numericality: { only_integer: true }
  validates :mentorship, presence: true
  validates :projects, presence: true
  validates :end, presence: true

end
