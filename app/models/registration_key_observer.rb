class RegistrationKeyObserver < ActiveRecord::Observer
  def after_create(key)
    RegistrationMailer.deliver_key_email(key)
    key.emailed_at = Time.now
    key.save
  rescue => e
    key.logger.error("Email problem: #{e.message}")
  end
end
