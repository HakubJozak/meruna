require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  context "Document " do
    setup do
      DocumentTest.subject { Factory.create(:pdf) }
    end

    should_validate_presence_of :name
    should_have_attached_file :file
  end
end
