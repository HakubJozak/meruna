class Admin::DocumentsController < Admin::BaseController
  active_scaffold :document do |c|
    c.list.columns = [ :language, :created_at, :thumb, :name, :file ]
    c.columns = [ :name, :document_type, :language, :file ]
    c.columns[:language].form_ui = :select
    c.columns[:document_type].form_ui = :select
  end
end
