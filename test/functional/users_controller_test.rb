require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  context "UserController" do
    setup do
      @user = Factory.build(:openid_user, :email => "jakub.hozak@gmail.com")
      @key = RegistrationKey.new(:email => @user.email)
      @key.save!
    end

    teardown do
      FakeWeb.clean_registry
    end
    
    should  "handle OpenID failure" do
      FakeWeb.register_uri(:get, "https://www.google.com/accounts/o8/id", :status => [404, "Not Found"] )
      post :create, :user => { :openid_identifier => 'doesnt_matter' }, :code => @key.code
      assert_template :new
    end


    should "be unable to register user without key" do
      assert_raise(RegistrationKey::InvalidRegistrationKey) do
        post :create, :user => Factory.attributes_for(:openid_user)
      end
    end

    # use script/mimic to record the web responses
    context "with Google working" do
      setup do
        fake_root = "#{RAILS_ROOT}/test/fakeweb"
        FakeWeb.register_uri(:get, "https://www.google.com/accounts/o8/id", :response => File.new("#{fake_root}/1"))
        FakeWeb.register_uri(:get, "https://www.google.com/accounts/o8/ud", :response => File.new("#{fake_root}/2"))
      end

      # should "be able to register" do
      #   post :create, :code => @key.code, :user => Factory.attributes_for(:google_user)
      #   assert_response :success

      #   assert assigns(:user).valid?

      #   registered_user = User.find_by_email("jakub.hozak@gmail.com")
      #   assert_not_nil registered_user, "Failed to register"
      # end
    end


  end
end
