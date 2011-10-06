require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  context "Using SessionController and " do
    
    setup do
      @password = "veryverysecure"
      @user = Factory.create(:native_user, :password => @password, :password_confirmation => @password)
    end

    should "show the login form" do
      get :new
      assert_response :success
      assert_template :new
    end

    should "handle login problems" do
      get :create
      assert_template :new
    end
      
    should "login without problems" do
      post :create, { "user_session" => { "login" => @user.login, "password" => @password }}
      assert_redirected_to admin_url
      logged_in = assigns(:user_session).user
      assert_not_nil logged_in, "user did not login"
      assert_equal @user.login, logged_in.login
    end

    context "while logged in as native user" do
      setup { login }

      should "logout without problems" do
        post :destroy
        assert_nil assigns(:user_session).user
        assert_redirected_to root_url
      end      
    end
 
    context "(OpenID user)" do
      setup do
        @user = Factory.build(:openid_user)
      end
      
      teardown do
        FakeWeb.clean_registry
      end

      should "gracefully handle OpenID errors" do
        FakeWeb.register_uri(:get, "https://www.google.com/accounts/o8/id", :status => [404, "Not Found"] )
        post :create, :user_session => { :openid_identifier => 'doesnt_matter' }
        assert_template :new
      end

      should "login without problems" do
        FakeWeb.register_uri(:get, "https://www.google.com/accounts/o8/id", :response => File.new("#{RAILS_ROOT}/test/fakeweb/1"))
      end
    end

  end
end

