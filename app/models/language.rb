class Language < ActiveRecord::Base
  enforce_schema_rules
  has_many :documents, :dependent => :destroy
end
