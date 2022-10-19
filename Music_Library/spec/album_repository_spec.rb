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