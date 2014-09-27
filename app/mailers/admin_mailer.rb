class AdminMailer < ActionMailer::Base
  ADMIN_EMAIL = "pinpeg.io@gmail.com"
  CONTACT_US_SUBJECT = '[pinpeg] Contact Us: '

  self.delivery_method = :sendmail

  default from: "no-reply@pinpeg.io"
  default reply_to: "no-reply@pinpeg.io"

  def contact_us(email, msg)
    @email = email
    @msg = msg
    mail(to: ADMIN_EMAIL, subject: CONTACT_US_SUBJECT + " " + email)
  end
end
