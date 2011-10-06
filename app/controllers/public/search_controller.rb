class Public::SearchController < Public::BaseController

  def index
    @results = []

    if @query = params[:q]
      @results.concat Headline.search(@query)
      @results.concat Article.search(@query)
      @results.concat Album.search(@query)
      @results.concat Photo.search(@query)
      # TODO - paginate and sort by latest
      # @results.sort_by { |date| }
    end
  end

end
