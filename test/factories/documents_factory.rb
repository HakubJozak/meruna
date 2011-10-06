require 'ftools'
require "#{RAILS_ROOT}/test/factories/factory_helper"

Factory.define :document do |d|
  d.name Lorem::Base.new('words', 6).output
  d.association :language
  d.association :document_type
end

Factory.define :pdf, :parent => :document do |d|
  d.file File.new("#{RAILS_ROOT}/test/factories/data/example.pdf")
end
