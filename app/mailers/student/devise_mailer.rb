class Student::DeviseMailer < Devise::Mailer
  self.delivery_method = :sendmail

  default from: "hello@pinpeg.io"
  default reply_to: "hello@pinpeg.io"

end
