require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  context "Article" do
    should "be findable by pretty name" do
      @article = Factory.create(:article, :path => 'fake_path', :key => 'key')
      Article.find_by_pretty_name( :path => 'fake_path', :key => 'key')
    end

    should "not create duplicate article" do      
      assert_raises ActiveRecord::RecordInvalid do
        2.times { Factory.create(:article, :path => 'fake_path', :key => 'key') }
      end
    end

  end
end
