Factory.define :album do |a|
  a.name 'Fake name'
end

Factory.define :photo do |p|
  p.association :album
  p.description 'Fake name'
  p.picture File.new("#{RAILS_ROOT}/test/factories/data/example-0.png")
end

