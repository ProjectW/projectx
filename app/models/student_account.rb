class StudentAccount < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
   
  has_many :resumes
  has_one :current_resume, :class_name => 'Resume'

  validates :full_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :school, presence: true
end
