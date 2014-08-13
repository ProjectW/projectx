class StudentAttributeList < ActiveRecord::Base
  belongs_to :student_account
  has_many :interested_roles

  enumerate :technical_level do
    value :name => 'none',    :id => 0
    value :name => 'low',     :id => 100
    value :name => 'medium',  :id => 200
    value :name => 'high',    :id => 300
  end
end
