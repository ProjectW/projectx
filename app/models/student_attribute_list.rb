class StudentAttributeList < ActiveRecord::Base
  belongs_to :student_account
  has_many :interested_roles

  enum technical_level: {
    no_tech: 0,
    low_tech: 100,
    mid_tech: 200,
    high_tech: 300
  }
end
