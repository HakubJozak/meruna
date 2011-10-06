class Public::HeadlinesController < Public::BaseController
  
  def index
    @headlines = Headline.all
  end

  def show
    @headline = Headline.find(params[:id])
  end
end
