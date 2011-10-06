class Profile < ActiveRecord::Base
  enforce_schema_rules
  has_attached_file :logo, :styles => { :medium => ["x300>",:png], :thumb => ["x100>",:png] }, :whiny => false
end
