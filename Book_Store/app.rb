# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/book_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

book_repository = BookRepository.new


# # Print out each record from the result set .
book_repository.all.each do |book|
p book.id + ' - ' + book.title + ' - ' + book.author_name 
end


#@List.map{|e| e.task if e.done? == true}.join("\n")
