class AdminMailer < ActionMailer::Base
  ADMIN_EMAIL = "pinpeg.io@gmail.com"
  ERROR_NOTIFICATION_SUBJECT = '[pinpeg] Error'
  CONTACT_US_SUBJECT = '[pinpeg] Contact Us: '
  RECRUITER_SUBJECT = '[pinpeg] Recruiter Sign Up'

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

  def raw_admin_email(subject, body)
    mail(
      :to => ADMIN_EMAIL,
      :subject => subject,
      :body => body)
  end

  def recruiter_email(firstName, lastName, email, cName, cURL)
    @firstName = firstName
    @lastName = lastName
    @email = email
    @cName = cName
    @cURL = cURL

    mail(to: ADMIN_EMAIL, subject: RECRUITER_SUBJECT)
  end

end
