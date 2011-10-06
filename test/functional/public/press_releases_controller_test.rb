require 'test_helper'

class Public::PressReleasesControllerTest < ActionController::TestCase
  context "PressReleasesController" do
    setup do
      5.times { Factory.create(:press_release) }
    end

    should "show recent releases" do
      get :index
      assert_response :success
    end

    should "show press release" do
      get :show, :id => PressRelease.first.id
      assert_response :success
    end
  end
end
