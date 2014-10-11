class Student::DevisePreview < ActionMailer::Preview
  def confirmation_instructions
    student = StudentAccount.first
    Student::DeviseMailer.confirmation_instructions(student, "randomtoken")
  end

  def reset_password_instructions
    student = StudentAccount.first
    Student::DeviseMailer.reset_password_instructions(student, "randomtoken")
  end
end
