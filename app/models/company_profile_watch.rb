class CompanyProfileWatch < ActiveRecord::Base
  belongs_to :company
  belongs_to :student_account

  def watching?
    self.watching
  end
end
