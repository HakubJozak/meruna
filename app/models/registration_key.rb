class RegistrationKey < ActiveRecord::Base

  validates_presence_of :email
  validates_uniqueness_of :email

  class InvalidRegistrationKey < StandardError
  end

  # just a development speed up
  def after_initialize
    if new_record?
      self.email ||= "jakub.hozak@gmail.com"
    end
  end


  def self.find_by_code(code)
    key = find(:first, :conditions => { :code => code })
    raise InvalidRegistrationKey.new("No key for code '#{code}' found") unless key
    key
  end

  def before_create
    self.code ||= SecureRandom.hex(13)
  end

  def valid_for?(user)
    key = RegistrationKey.find_by_code(code)
    return key.email == user.email
  end

end
