class CreateDefaultArticles < ActiveRecord::Migration

  def self.up
    keys = [[ 'news', 'photos', 'videos', 'calendar' ],
            [ 'project', 'organizers', 'kenyan-team', 'partners' ],
            [ 'press_releases', 'documents', 'development_faq' ],
            [ 'join_us_schools', 'join_us_students', 'play_a_game', 'shoutbox' ]]

    keys.flatten.each do |key|
      Article.create!(:key => key, :title => key, :path => key)
    end
  end

  def self.down
      Article.delete_all
  end

end
