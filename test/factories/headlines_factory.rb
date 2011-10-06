Factory.define :headline do |h|
  h.title 'Interesting'
  h.short 'Briefly...'
  h.long  'Loooooooooooooooooooooooooooong'
  h.association :news_type
end
