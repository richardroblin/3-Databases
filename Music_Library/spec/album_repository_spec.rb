require 'album_repository'

# file: spec/album_repository_spec.rb

def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  
RSpec.describe AlbumRepository do
    before(:each) do 
      reset_albums_table
    end

    context 'can retrieve all albums' do

        it 'returns all albums' do
            repo = AlbumRepository.new
            albums = repo.all
            expect(albums.length).to eq 2
        end

        it 'returns first album details' do
            repo = AlbumRepository.new
            albums = repo.all
            expect(albums.first.title).to eq 'Doolittle'
            expect(albums.first.release_year).to eq '1989'
            expect(albums.first.artist_id).to eq '1'
        end

        it 'returs second album details' do
            repo = AlbumRepository.new
            albums = repo.all
            expect(albums[1].title).to eq  'Surfer Rosa'
            expect(albums[1].release_year).to eq '1988'
            expect(albums[1].artist_id).to eq '1'
        end

    end

    context 'can find an album' do

        it 'finds a single album' do
            repo = AlbumRepository.new
            album = repo.find(1)
            expect(album.id).to eq '1'
            expect(album.title).to eq 'Doolittle'
            expect(album.release_year).to eq '1989'
            expect(album.artist_id).to eq '1'
        end

    end

    context 'can add a new album' do

        it 'inserts a single album' do
            repo = AlbumRepository.new
            album = Album.new
            album.title = 'Trompe le Monde'
            album.release_year = 1991
            album.artist_id = 1
            repo.create(album)
            all_albums = repo.all
            expect(all_albums.length).to eq 3
        end
 
    end

    context 'can delete an album' do

        it 'deletes a single album' do
            repo = AlbumRepository.new
            album = repo.delete(1)
            expect(repo.all.length).to eq 1
        end
    end


end