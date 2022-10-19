require_relative 'artist'

class ArtistRepository

  # Selecting all records
  # No arguments

  # Executes the SQL query:
  # SELECT id, name, cohort_name FROM artists;
  # Returns an array of Artist objects.
  def all
      sql = 'SELECT id, name, genre FROM artists;'
      result_set = DatabaseConnection.exec_params(sql, [])

      artists = []

      result_set.each do|record|
          artist = Artist.new
          artist.id = record['id']
          artist.name = record['name']
          artist.genre = record['genre']

          artists << artist
        end

      return artists

  end
    
  # Gets a single record by its ID
  # One argument: the id (number)

#   def find(id)
#     # Executes the SQL query:
#     # SELECT id, name, cohort_name FROM artistss WHERE id = $1;

#     # Returns a single Artist object.
#     sql = "SELECT id, name, genre FROM artists WHERE ID = #{id};"
#     result_set = DatabaseConnection.exec_params(sql, [])

#     artist = Artist.new

#     return artist

#     end

  # Add more methods below for each operation you'd like to implement.

  # def create(artist)
        # sql ="INSERT INTO artist (name, genre) VALUES (name, genre)"
        # result_set = DatabaseConnection.exec_params(sql, [name, genre])



        # new_artist = Student.new
        # new_artist.name = 'Josh'
        # new_artist.cohort_name = 'March 22'

        # repository.create(artist) # Creates a new student by performing a INSERT query.

  # end

  # def update(student)
  # end

  # def delete(student)
  # end

end