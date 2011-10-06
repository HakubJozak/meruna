require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  
  context "While logged in" do
    setup { login }

    context "and listin users" do
      setup { get :list }
      should_be_active_scaffold
    end

    should "create user with non-empty registration key" do
      Factory.attributes_for :openid_user
#      post :create
    end
  end

end
