require 'test_helper'

class Public::AlbumsControllerTest < ActionController::TestCase
  context "Albums controller" do
    setup { 10.times { Factory.create(:album) }}    
  end

  should "show list of albums" do
    get :index
    assert_response :success
  end
end
