class StudentAccount < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
   
  has_many :resumes
  has_one :attribute_list, :class_name => "StudentAttributeList"
  belongs_to :school
  belongs_to :current_resume, :class_name => "Resume"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@college\.harvard\.edu\Z/i }
  validates :school_id, presence: true
  validates :graduation_year, presence: true

  def set_current_resume!(resume)
    if resume.student_account_id != self.id 
      raise 'Resume does not belong to current student account'
    end

    self.current_resume = resume
    self.save
  end

end
