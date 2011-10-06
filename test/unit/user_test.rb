require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    activate_authlogic
  end

  context "native user" do

    setup do
      UserTest.subject { Factory.build(:native_user) }
    end

    should "validate email" do
      [ nil, "", "without_at_sign.com"].each do |value|
        assert_bad_value subject, :email, value
      end
    end

    should "validate login" do
      [ nil, "", "sm"].each do |value|
        assert_bad_value subject, :login, value
      end
    end

    should_not_allow_values_for :password, "sml"
    should("tell it is native") { assert !subject.using_openid? }
  end

  context "OpenID user" do
    setup {  UserTest.subject { Factory.build(:openid_user) }}

    should("tell it is OpenID") do
      assert subject.using_openid?
    end

    should "allow empty password" do
      u = Factory.build(:openid_user)
      u.password = u.password_confirmation = ""
      assert u.valid?, u.errors.full_messages
    end

    should "register without problems" do
      
    end
  end

end

