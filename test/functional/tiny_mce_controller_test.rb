require 'test_helper'

class TinyMceControllerTest < ActionController::TestCase
  context "TinyMceController" do
    
    setup do
      login
      3.times { Factory.create(:profile) }
    end

    should "return list of links" do
      get :links
      assert_response :success
    end
  end
end
