class Resume < ActiveRecord::Base
  belongs_to :student_account

  validates :student_account_id, presence: true
end
