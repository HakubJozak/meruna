require 'test_helper'

class Admin::PressReleasesControllerTest < ActionController::TestCase
  context "While editing press releases" do
    setup do
      login
      get :list
    end

    should_be_active_scaffold
  end
end
