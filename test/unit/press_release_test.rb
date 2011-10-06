require 'test_helper'

class PressReleaseTest < ActiveSupport::TestCase
  context "PressReleaseTest" do
    setup do
      PressReleaseTest.subject { Factory.create(:press_release) }
    end

    should_validate_presence_of :title
  end

end
