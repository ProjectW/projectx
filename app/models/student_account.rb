class StudentAccount < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
   
  has_many :resumes
  has_one :attribute_list, :class_name => "StudentAttributeList"
  belongs_to :school

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i } # TODO make .edu
  validates :school_id, presence: true
  validates :graduation_year, presence: true

  def set_current_resume(resume)
    if resume.student_account_id != self.id 
      throw 'Resume does not belong to current student account'
    end

    self.resumes.update_all( :current => false )
    resume.current = true
    resume.save
  end

end
