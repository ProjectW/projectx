class Student::DeviseMailer < Devise::Mailer
  self.delivery_method = :sendmail

  default from: "no-reply@pinpeg.io"
  default reply_to: "no-reply@pinpeg.io"

end
