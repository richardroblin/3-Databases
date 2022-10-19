require 'artist_repository'

def reset_artists_table
    seed_sql = File.read('spec/seeds_artists.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test'})
    connection.exec(seed_sql)
end

RSpec.describe ArtistRepository do

    before(:each) do 
        reset_artists_table
      end
      
    # 1
    # Get all artists
    it 'returns all records' do
        repo = ArtistRepository.new
        artists = repo.all
        expect(artists.length).to eq  2
    end
    
    it 'returns the first record correctly' do
        repo = ArtistRepository.new
        artists = repo.all
        expect(artists.first.id).to eq '1'
        expect(artists.first.name).to eq 'Pixies'
        expect(artists.first.genre).to eq 'Rock'
    end

    it 'returns the second record correctly' do
        repo = ArtistRepository.new
        artists = repo.all
        expect(artists[1].id).to eq '2'
        expect(artists[1].name).to eq 'ABBA'
        expect(artists[1].genre).to eq 'Pop'
    end
    # 2
    # Get a single student
    # it 'returns an individual artist' do
    #     repo = ArtistRepository.new
    #     artists = repo.find(1)
    #     expect(artists.id).to eq '1'
    #     expect(artists.name).to eq 'Pixies'
    #     expect(artists.genre).to eq 'Rock'
    # end

# Add more examples for each method

    
end
