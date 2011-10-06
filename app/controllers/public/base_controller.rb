class Public::BaseController < ApplicationController
  layout 'public'
  helper 'public/menu', 'public/headlines', 'public/slideshow'

  before_filter :set_cache_buster, :only => [ :homepage ]
  before_filter :set_slide_number
  
  def homepage
    @at_home = true
    render :text => '', :layout => 'home'
  end

  private

  def set_slide_number
    if s = params[:s]
      cookies[:slide_number] = { :value => s.to_i, :expires => 1.hour.from_now }
      @slide_number = s.to_i
    else
      @slide_number = cookies[:slide_number] || 1
    end
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end  

end
