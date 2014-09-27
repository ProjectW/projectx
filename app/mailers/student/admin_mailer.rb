class Student::AdminMailer < ActionMailer:Base
  self.delivery_method = :sendmail

  default from: "no-reply@pinpeg.io"
  default reply_to: "no-reply@pinpeg.io"

end
