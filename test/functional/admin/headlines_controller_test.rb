require 'test_helper'

class Admin::HeadlinesControllerTest < ActionController::TestCase
  active_scaffold_context "Headlines" do
    should "create headline" do
      post :create, :record => Factory.attributes_for(:headline)
      assert_response :success
    end
  end
end
