class Admin::ArticlesController < Admin::BaseController
  active_scaffold :articles do |config|
    config.list.columns = [ :path, :key, :title, :image ]
    config.columns = [ :path, :key, :title, :image, :content ]
    config.columns[:content].form_ui = :text_editor    
  end
end
