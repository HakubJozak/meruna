class RegistrationMailer < ActionMailer::Base
  
  def key_email(key)
    subject    'Football for Development Website Registration'
    recipients key.email
    from       'noreply@football4development.com'
    sent_on    Time.now
    content_type  "text/html"
    body       :registration_key => key
  end

end
