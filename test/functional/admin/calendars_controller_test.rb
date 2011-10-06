require 'test_helper'

class Admin::CalendarsControllerTest < ActionController::TestCase

  context "While editing press calendars" do
    setup do
      login
      get :list
    end

    should_be_active_scaffold
  end
end
