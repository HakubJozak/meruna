class Calendar < ActiveRecord::Base
  enforce_schema_rules

  def after_initialize
    self.url = "http://www.google.com/calendar/feeds/59vvnj99rbuom8f56eal5jpl6g%40group.calendar.google.com/public/full"
  end

  # TODO - take care of which parameter :all/:today
  def events(which = :today)
    parameters = "?orderby=starttime&futureevents=true"
    feed = Calendar.google_client.get(self.url + parameters).to_xml
    events = []

    feed.elements.each('entry') do |xml_event|
      events << Event.new(xml_event)
    end

    events
  end

  private

  def self.google_client
    unless @client
      @client = GData::Client::Calendar.new
      @client.clientlogin('footballfordevelopment@gmail.com', 'darkbeer')
    end

    @client
  end

end
