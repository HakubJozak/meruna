require 'test_helper'

class RegistrationMailerTest < ActionMailer::TestCase
  test "key_email" do
    @expected.subject = 'Football for Development Website Registration'
    @expected.body    = read_fixture('key_email')
    @expected.date    = Time.now
    @expected.content_type = 'text/html; charset=utf-8'
    @expected.from = 'noreply@football4development.com'
    @expected.to = "jakub.hozak@gmail.com"

    key = RegistrationKey.new(:email => 'jakub.hozak@gmail.com', :code => 'ef82f57daccd5010cc513c88ea')
    assert_equal @expected.encoded, RegistrationMailer.create_key_email(key).encoded
  end

end
