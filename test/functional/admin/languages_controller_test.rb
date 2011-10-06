require 'test_helper'

class Admin::LanguagesControllerTest < ActionController::TestCase
  context "While listing languages" do
    setup do
      login
      Factory.create(:language)
      get :list
    end

    should_respond_with :success
    should_render_template :list
    should_render_with_layout 'admin'
  end

end
