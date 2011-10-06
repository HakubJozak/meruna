module Public::SearchHelper
  
  def url_for_search_result(record)
    record = record.album if Photo === record

    if Article === record
      named_article_url( :path => record.path, :key => record.key )
    else
      send("public_#{record.class.to_s.underscore}_path", record)
    end
  end

end
