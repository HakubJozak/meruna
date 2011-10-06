require 'test_helper'

class LoginTest < ActionController::IntegrationTest

  def setup
    @admin = Factory.create(:admin)
  end

  # test "Admin login" do
  #   visit "/"
  #   click_link "LOGIN"
  #   fill_in "login", :with => @admin.login
  #   fill_in "password", :with => @admin.password
  #   click_button "Login"
  #   assert_contain "Successfully logged"
  #   click_link "Administration"
  #   assert_have_selector "#menu"
  # end

end
