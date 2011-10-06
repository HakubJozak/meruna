require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  context "While using inline XML" do
    setup do
      xml = <<ENTRY
<?xml version='1.0' encoding='UTF-8'?>
<feed xmlns='http://www.w3.org/2005/Atom' xmlns:app='http://www.w3.org/2007/app' xmlns:gCal='http://schemas.google.com/gCal/2005' xmlns:openSearch='http://a9.com/-/spec/opensearch/1.1/' xmlns:gd='http://schemas.google.com/g/2005' gd:etag='W/&quot;CkAHSH47eCp7IGA9WxBSEUk.&quot;' gd:kind='calendar#event'>
<entry gd:etag="FkULTg1Hdip7IGA6WhVa" gd:kind="calendar#event">
  <id>http://www.google.com/calendar/feeds/jakub.hozak%40gmail.com/events/rklr60fjij85elno09kp408krg</id>
  <published>2009-12-11T20:25:46.000Z</published>
  <updated>2009-12-18T11:46:08.000Z</updated>
  <app:edited>2009-12-18T11:46:08.000Z</app:edited>
  <category scheme="http://schemas.google.com/g/2005#kind" term="http://schemas.google.com/g/2005#event"/>
  <title>Automat</title>
  <content/>
  <author>
    <name>Jakub Hozak</name>
    <email>jakub.hozak@gmail.com</email>
  </author>
  <gd:eventStatus value="http://schemas.google.com/g/2005#event.confirmed"/>
  <gd:where valueString=""/>
  <gd:when endTime="2009-12-18T12:33:00+01:00" startTime="2009-12-17"/>
  <gCal:sequence value="1"/>
  <gCal:uid value="rklr60fjij85elno09kp408krg@google.com"/>
</entry>
</feed>       
ENTRY
      xml = REXML::Document.new(xml)
      @event = Event.new(xml.elements["//entry"])
    end
  
    should "load Event correctly" do
      assert_equal @event.startTime, Date.new(2009,12,17)
      # TODO - fix the timezone in test date
      # assert_equal @event.endTime, DateTime.new(2009,12,18,12,33,0)
      assert_equal @event.endTime.to_date, Date.new(2009,12,18)
    end    
  end

end




