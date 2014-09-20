class CompanyProfileView < ActiveRecord::Base
  belongs_to :company
  belongs_to :student_account
end
