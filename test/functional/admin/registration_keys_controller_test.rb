require 'test_helper'

class Admin::RegistrationKeysControllerTest < ActionController::TestCase
  context "RegistrationKeys editor" do
    setup do
      login
      get :list
    end

    should_be_active_scaffold
  end

end
