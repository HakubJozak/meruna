class Admin::PressReleasesController < Admin::BaseController
   active_scaffold :press_release do |c|
    c.columns = [ :released_at, :title, :news_type, :body ]
    c.columns[:body].form_ui = :text_editor    
    c.columns[:news_type].form_ui = :select
  end
end
