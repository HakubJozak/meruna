require 'test_helper'

class Admin::AlbumsControllerTest < ActionController::TestCase
  active_scaffold_context "Albums" do
    setup do
    end

    should 'show ZIP uploads dialog' do
      @album = Factory.create(:album)
      get :upload_zip, :id => @album.id
      assert_response :success
      assert_equal @album.id, assigns(:album).id
    end

    should 'handle ZIP uploads' do
      @album = Factory.create(:album)
      get :upload_zip, :id => @album.id, :zip => File.new("#{RAILS_ROOT}/test/factories/data/album.zip"), :commit => 'submit'
      assert_redirected_to :action => :index
    end


  end
end
