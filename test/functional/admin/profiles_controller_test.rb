require 'test_helper'

class Admin::ProfilesControllerTest < ActionController::TestCase
  context "Admin::ProfilesController" do
    setup do
      login
      get :list
    end

    should_be_active_scaffold    
  end
end
