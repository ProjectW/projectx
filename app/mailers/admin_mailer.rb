class AdminMailer < ActionMailer::Base
  ADMIN_EMAIL = "pinpeg.io@gmail.com"
  ERROR_NOTIFICATION_SUBJECT = '[pinpeg] Error'
  CONTACT_US_SUBJECT = '[pinpeg] Contact Us: '

  self.delivery_method = :sendmail

  default from: "no-reply@pinpeg.io"
  default reply_to: "no-reply@pinpeg.io"

  def contact_us(email, msg)
    @email = email
    @msg = msg
    mail(to: ADMIN_EMAIL, subject: CONTACT_US_SUBJECT + " " + email)
  end

  def error_notification(params, msg = nil)
    @params = params
    @msg = msg
    mail(to: ADMIN_EMAIL, subject: ERROR_NOTIFICATION_SUBJECT)
  end

end
