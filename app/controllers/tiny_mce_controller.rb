class TinyMceController < Admin::BaseController
  layout nil

  def links
    # TODO - add profiles 'link' when the article template/resource is ready
    # profiles = Profile.find(:all).map { |p| pair("#{p.name} Profile", public_profile_path(p)) }
    releases = PressRelease.find(:all).map { |p| ["'#{p.title}' press release", public_press_release_path(p)] }
    render :js => generate_js( releases )
  end

  private
  
  def generate_js(list)
    result = "var tinyMCELinkList = new Array("

    list.each_with_index do |link,i|
      result << ',' unless i == 0
      result << pair(link[0],link[1])
    end

    result << ");"    
  end

  def pair(name, value)
    %/["#{name}", "#{value}"]/
  end
end
