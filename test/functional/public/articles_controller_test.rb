require 'test_helper'

class Public::ArticlesControllerTest < ActionController::TestCase
  context "Public Articles " do
    setup do
      @article = Factory.create(:article)
    end

    should "show an Article by pretty name" do
      get :show, :key => @article.key, :path => @article.path
      assert_not_nil assigns(:article).title
      assert_response :success
    end
  end
end
