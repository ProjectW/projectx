class Student::DeviseMailer < Devise::Mailer
  self.delivery_method = :sendmail
  
  default from: "no-reply@104.131.138.241"
  default reply_to: "no-reply@104.131.138.241"

end
