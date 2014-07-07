class StudentAccount < ActiveRecord::Base
  has_many :resumes
  has_one :current_resume, :class_name => 'Resume'
end
