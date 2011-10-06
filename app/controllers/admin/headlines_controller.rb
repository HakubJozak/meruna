class Admin::HeadlinesController < Admin::BaseController
  active_scaffold :headlines do |c|
    c.columns = [ :title, :news_type, :image, :short, :long ]
    c.list.columns = [ :title, :news_type, :short ]
    c.columns[:news_type].form_ui = :select
    c.columns[:short].form_ui = :textarea
    c.columns[:long].form_ui = :text_editor
    c.columns[:short].description = 'Up to 1000 characters'
  end
end
