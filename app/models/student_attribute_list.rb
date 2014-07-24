class StudentAttributeList < ActiveRecord::Base
  belongs_to :student_account
  has_many :interested_roles

end
