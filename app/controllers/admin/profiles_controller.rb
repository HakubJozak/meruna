class Admin::ProfilesController < Admin::BaseController
  active_scaffold :profiles do |c|
    c.actions.exclude :create

    c.columns = [ :name, :contact_person, :contact_email, :logo, 
                  :address, :description ]

    c.columns[:address].form_ui = :text_editor    
    c.columns[:description].form_ui = :text_editor    
  end
end
