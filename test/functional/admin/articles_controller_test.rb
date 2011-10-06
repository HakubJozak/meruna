require 'test_helper'

class Admin::ArticlesControllerTest < ActionController::TestCase
  context "While editing articles" do
    setup do
      login
      get :list
    end

    should_be_active_scaffold
  end
end
