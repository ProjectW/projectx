class CompanyProfileWatch < ActiveRecord::Base
  belongs_to :company
  belongs_to :student_account

  def watching?
    self.watching
  end

  def self.student_watches(student_account_id)
    CompanyProfileWatch.where(:student_account_id => student_account_id, :watching => true)
  end
end
