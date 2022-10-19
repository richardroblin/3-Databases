require_relative 'album'

class AlbumRepository

    def all
        sql = 'SELECT id, title, release_year, artist_id FROM albums;'
        result_set = DatabaseConnection.exec_params(sql, [])

        albums = []

        result_set.each do|record|
          album = Album.new
          album.id = record['id']
          album.title = record['title']
          album.release_year = record['release_year']
          album.artist_id = record['artist_id']

          albums << album
        end

      return albums
    end

    def find(id)
      # Executes the SQL query:
      # SELECT id, name, cohort_name FROM artistss WHERE id = $1;
      sql = "SELECT id, title, release_year, artist_id FROM albums WHERE ID = $1;"
      result_set = DatabaseConnection.exec_params(sql, [id])
      record = result_set[0]

      # Returns a single Artist object.

      album = Album.new
      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']

      return album

    end

end