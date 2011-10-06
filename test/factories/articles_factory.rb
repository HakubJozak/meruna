Factory.define :article do |a|
  a.sequence(:key) {|n| "article#{n}" }
  a.path '/fake/path'
  a.title 'fake title'
end

