class FullTextSearch1270808061 < ActiveRecord::Migration
  def self.up
      ActiveRecord::Base.connection.execute(<<-'eosql')
        DROP index IF EXISTS articles_fts_idx
      eosql
      ActiveRecord::Base.connection.execute(<<-'eosql')
                CREATE index articles_fts_idx
        ON articles
        USING gin((to_tsvector('english', coalesce(articles.title, '') || ' ' || coalesce(articles.path, '') || ' ' || coalesce(articles.content, ''))))

      eosql
      ActiveRecord::Base.connection.execute(<<-'eosql')
        DROP index IF EXISTS photos_fts_idx
      eosql
      ActiveRecord::Base.connection.execute(<<-'eosql')
                CREATE index photos_fts_idx
        ON photos
        USING gin((to_tsvector('english', coalesce(photos.description, ''))))

      eosql
      ActiveRecord::Base.connection.execute(<<-'eosql')
        DROP index IF EXISTS albums_fts_idx
      eosql
      ActiveRecord::Base.connection.execute(<<-'eosql')
                CREATE index albums_fts_idx
        ON albums
        USING gin((to_tsvector('english', coalesce(albums.name, ''))))

      eosql
      ActiveRecord::Base.connection.execute(<<-'eosql')
        DROP index IF EXISTS headlines_fts_idx
      eosql
      ActiveRecord::Base.connection.execute(<<-'eosql')
                CREATE index headlines_fts_idx
        ON headlines
        USING gin((to_tsvector('english', coalesce(headlines.title, '') || ' ' || coalesce(headlines.short, '') || ' ' || coalesce(headlines.long, ''))))

      eosql
  end
end
