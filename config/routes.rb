ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  map.root :controller => 'public/base', :action => :homepage
  map.admin '/admin',:controller => 'admin/headlines', :action => :index
  map.register 'register', :controller => 'users', :action => 'new'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.links "links", :controller => :tiny_mce, :action => :links
  map.upload_zip 'upload_zip', :controller => 'admin/albums', :action => 'upload_zip'
  map.colors '/stylesheets/colors.css', :controller => 'admin/base', :action => 'colors'
  map.search '/search', :controller => 'public/search', :action => 'index'

  map.public_organizers '/about-us/organizers', :controller => 'public/articles', :action => 'show_profiles'
  map.public_photos '/highlights/albums', :controller => 'public/albums', :action => 'index'
  map.public_news '/highlights/news', :controller => 'public/headlines', :action => 'index'
  map.public_downloads '/documents/downloads', :controller => 'public/documents', :action => 'index'

  map.resources :users
  map.resources :user_sessions

  map.namespace :public, :path_prefix => '' do |public|
    public.download_document 'documents/download/:id', :controller => :documents, :action => :download
    public.resources :albums
    public.resources :documents, :as => 'downloads'
    public.resources :headlines
    public.resources :profiles
    public.resources :press_releases
    public.resources :events
  end

  map.namespace :admin do |admin|
    admin.resources :headlines, :active_scaffold => true
    admin.resources :profiles, :active_scaffold => true
    admin.resources :documents, :active_scaffold => true
    admin.resources :articles, :active_scaffold => true
    admin.resources :press_releases, :active_scaffold => true
    admin.resources :users, :active_scaffold => true
    admin.resources :languages, :active_scaffold => true
    admin.resources :calendars, :active_scaffold => true
    admin.resources :registration_keys, :active_scaffold => true
    admin.resources :news_types, :active_scaffold => true
    admin.resources :document_types, :active_scaffold => true
    admin.resources :albums, :active_scaffold => true
    admin.resources :photos, :active_scaffold => true
    admin.resources :banners, :active_scaffold => true
  end

  map.named_article '/:path/:key', :controller => 'public/articles', :action => :show
  map.category '/:path', :controller => 'public/base', :action => :homepage

end


