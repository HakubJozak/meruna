require "#{RAILS_ROOT}/test/factories/factory_helper"

Factory.define :press_release do |pr|
  pr.association :news_type
  pr.title Lorem::Base.new('words', r(7)).output
  pr.body  Lorem::Base.new('words', 20 + r(50)).output
  pr.released_at r(10).days.ago
end
