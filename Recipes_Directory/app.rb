# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'


# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

recipe_repository = RecipeRepository.new


p recipe_repository.all



#find album with ID = 3
# find_album = album_repository.find(3)

# p "Album found is: " + find_album.id + ' ' + find_album.title

# p album_repository.all