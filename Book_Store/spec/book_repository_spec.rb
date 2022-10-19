require 'book_repository'

def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end

RSpec.describe BookRepository do

    before(:each) do 
        reset_books_table
      end

    it 'returns 2 books' do

        repo = BookRepository.new
        books = repo.all

        expect(books.length).to eq 2
    end

     it 'returns the first book correctly' do
        repo = BookRepository.new
        books = repo.all
        expect(books[0].id).to eq "1"
        expect(books[0].title).to eq 'Hello'
        expect(books[0].author_name).to eq 'Joe'
    end

    it 'returns the second book correctly' do
        repo = BookRepository.new
        books = repo.all
        expect(books[1].id).to eq '2'
        expect(books[1].title).to eq 'World'
        expect(books[1].author_name).to eq 'Bloggs'
    end
    
end