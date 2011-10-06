class ArticlesForSlides < ActiveRecord::Migration
  def self.up
    Article.create(:path => 'about-us', :key => 'tournaments', :title => 'tournaments'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'informal-intercultural-learning', :title => 'informal-intercultural-learning'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'gender-equality', :title => 'gender-equality'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'fair-play-tournaments', :title => 'fair-play-tournaments'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'vienna-conference', :title => 'vienna-conference'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'ngdo-meeting', :title => 'ngdo-meeting'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'personal-and-social-growth', :title => 'personal-and-social-growth'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'raising-awareness', :title => 'raising-awareness'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'civic-responsibility', :title => 'civic-responsibility'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'school-programme', :title => 'school-programme'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'discussions', :title => 'discussions'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'media-campaign', :title => 'media-campaign'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'mdg-goals', :title => 'mdg-goals'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'mysa-tour', :title => 'mysa-tour'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'workshops', :title => 'workshops'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'rome-workshop', :title => 'rome-workshop'.camelize.gsub(/-/,' '))
    Article.create(:path => 'about-us', :key => 'vienna-workshop', :title => 'vienna-workshop'.camelize.gsub(/-/,' '))
  end

  def self.down
  end
end
