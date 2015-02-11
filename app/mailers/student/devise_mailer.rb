class Student::DeviseMailer < Devise::Mailer
  self.delivery_method = :sendmail

  default from: "pinpeg.io@gmail.com"
  default reply_to: "pinpeg.io@gmail.com"

end
