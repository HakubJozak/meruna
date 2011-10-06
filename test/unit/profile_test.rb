require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  context "Profile " do
    setup do
      ProfileTest.subject { Factory.create(:profile) }
    end

    should_validate_presence_of :name
  end

end
