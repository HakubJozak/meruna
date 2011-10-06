require 'test_helper'

class RegistrationKeyTest < ActiveSupport::TestCase
  context "RegistrationKey" do
    setup do
      RegistrationKeyTest.subject { Factory.build(:registration_key) }
      @user = Factory.create(:openid_user)
      @user.stubs(:email).returns("some@example.org")
      @key = Factory.create(:registration_key, :email => @user.email) 
    end

    should_validate_presence_of :email

    should "be valid for matching user and email" do
      assert @key.valid_for?(@user)
    end

    should "be findable by code" do
      assert_equal @key, RegistrationKey.find_by_code(@key.code)
    end

    should "allow specifying code" do
      key = RegistrationKey.create(:email => 'some', :code => 'other')
      assert_equal 'other', key.code
    end

    should "throw an exception when no code match" do
      assert_raise (RegistrationKey::InvalidRegistrationKey) { RegistrationKey.find_by_code("INVALID") }
    end

  end
end
