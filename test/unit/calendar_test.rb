require 'test_helper'

# TODO - cache the responses by FakeWeb
class CalendarTest < ActiveSupport::TestCase
  context "Calendar " do
    setup do
      @calendar = Calendar.new
    end

    should "fetch today events" do
      2.times { assert_not_nil @calendar.events(:all) }
    end
  end
end
