require 'test_helper'

class Public::SearchControllerTest < ActionController::TestCase
  context "Search" do
    setup do
      @headline_id = Factory.create(:headline, :title => 'Contains TRAP !').id
      @album_id = Factory.create(:album, :name => 'Contains hidden TRAP.').id
      Factory.create(:article, :title => 'TRAP', :content => 'is not null')
      Factory.create(:photo, :description => 'TRAP')
    end

    should "find decoys" do
      get :index, :q => 'trap'
      assert_response :success
      assert_equal 4, assigns(:results).size
      assert_select "#album_#{@album_id}"
      assert_select "#headline_#{@headline_id}"
    end

  end
end
