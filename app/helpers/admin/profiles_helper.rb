module Admin::ProfilesHelper
  def logo_column(profile)
    image_tag( profile.logo.url(:thumb), :class => 'document_thumb', :width => '40px')
  end
end
