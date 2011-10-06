class Public::ArticlesController < Public::BaseController
  def show
    @article = Article.find_by_pretty_name(:path => params[:path], :key => params[:key])
  end

  def show_profiles
    @profiles = Profile.find(:all, :order => 'name DESC')
  end

end
