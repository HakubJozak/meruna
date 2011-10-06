require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
  context "Language" do
    setup do
      @language = Factory.create(:language)
    end

    context "with documents" do
      setup do
	3.times { @language.documents.create(Factory.attributes_for(:pdf)) }
      end

      should "list all document" do
        assert_equal 3, @language.documents.size
      end
    end
  end
end
