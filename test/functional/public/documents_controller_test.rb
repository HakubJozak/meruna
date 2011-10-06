require 'test_helper'

class Public::DocumentsControllerTest < ActionController::TestCase
  context "Public::DocumentsController" do
    setup do
      3.times { Factory.create(:pdf) }
    end

    should "show documents" do
      get :index
      assert_response :success
      assert_template "index"
    end

    should "download document" do
      get :download, :id => Document.first.id
      assert_response :success
      assert_download "example.pdf"
    end
  end
end
