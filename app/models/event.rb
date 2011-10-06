class Event
  attr_accessor :title, :content, :startTime, :endTime

  WITH_TIME = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(.\d{3})?(-|\+){1}\d{2}:\d{2}$/
  JUST_DATE = /^\d{4}-\d{2}-\d{2}$/  
  
  def initialize(xml)
    @id = xml.elements['id'].text
    @title = xml.elements['title'].text
    @content = xml.elements['content'].text
    set_when(xml.elements['gd:when'])
  end
  
  private
  
  def set_when(xml)
    @startTime = parse_xsd_time(xml.attribute("startTime").value)
    @endTime = parse_xsd_time(xml.attribute("endTime").value)
  end
  
  def parse_xsd_time(time)    
    if  time =~ JUST_DATE
      Date.parse(time)
    elsif time =~ WITH_TIME
      DateTime.parse(time)
    else
      nil # raise ArgumentError.new("Wrong time format: #{time}")
    end          
  end
end
