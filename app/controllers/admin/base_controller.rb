class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :require_user

  uses_tiny_mce :options => {
    :theme => 'advanced',
    :plugins => %w( table inlinepopups ),

    # add 'code' for super-user
    :theme_advanced_buttons1 => "link,image,formatselect,|,bold,italic,underline,|,undo,redo,|,justifyleft,justifycenter,justifyright,justifyfull,|,bullist,numlist,|,removeformat,|,code",
    :theme_advanced_buttons2 => "",
    :theme_advanced_blockformats => "p,h3,h4,h5,h6,blockquote",
    :theme_advanced_buttons3 => "",
    :theme_advanced_buttons4 => "",
    :theme_advanced_toolbar_location => "top",
    :theme_advanced_toolbar_align => "center",
    :theme_advanced_statusbar_location => "bottom",
    :theme_advanced_resizing => true,
    :extended_valid_elements => "a[class|name|href|target|title|onclick|rel],img[class|src|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name],$elements,iframe[src|style|width|height|scrolling|marginwidth|marginheight|frameborder],",
    :content_css => "/stylesheets/content.css",
    :width => "600",
    :height => "300",
    :external_link_list_url => '/links', 
  }  
  
  ActiveScaffold.set_defaults do |config|
  end

  before_filter :set_title

  def set_title
    @content_for_title = "Football For Development - #{self.class.name.humanize}"
  end

  def colors
    render :template => '/admin/base/colors.css.erb', :layout => false
  end


end
