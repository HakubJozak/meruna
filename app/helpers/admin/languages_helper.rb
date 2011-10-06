
module Admin::LanguagesHelper
  def flag_column(lang)
    image_tag("flags/#{lang.code}.png")    
  end  
end
