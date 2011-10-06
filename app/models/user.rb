class User < ActiveRecord::Base

  has_one :registration_key, :dependent => :destroy
  
  GOOGLE_OPENID_ENDPOINT = 'https://www.google.com/accounts/o8/id'
  AX_FIRST_NAME = "http://axschema.org/namePerson/first"
  AX_LAST_NAME = "http://axschema.org/namePerson/last"
  AX_EMAIL = "http://axschema.org/contact/email"

  validates_presence_of :email, :if => :not_using_openid?
  validates_presence_of :login, :if => :not_using_openid?
  validates_length_of :login, :in => 3..255, :if => :not_using_openid?
  validates_format_of :login, :with => Authlogic::Regex.login, :if => :not_using_openid?
  validates_format_of :email, :with => Authlogic::Regex.email, :if => :not_using_openid?
  
  acts_as_authentic do |c|
    c.openid_required_fields = [ :email, AX_EMAIL, AX_FIRST_NAME, AX_LAST_NAME  ]
    c.validate_email_field = false
    c.validate_login_field = false
  end

  def not_using_openid?
    self.openid_identifier.blank?
  end

  def using_openid?
    !self.not_using_openid?
  end

  protected 

  def map_openid_registration(registration)
    begin
      self.email = registration[AX_EMAIL] && registration[AX_EMAIL].first rescue "Failed to get email"
      self.fullname = "#{registration[AX_FIRST_NAME]} #{registration[AX_LAST_NAME]}" rescue "Failed to get fullname"
    end
  end
end
