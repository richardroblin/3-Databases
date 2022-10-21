require_relative '../app'

def reset_pg_tables
    seed_artists_sql = File.read('spec/seeds_artists.sql')
    seed_albums_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_artists_sql)
    connection.exec(seed_albums_sql)
end

RSpec.describe Application do

        before(:each) do 
        reset_pg_tables
        end

    context 'greets the user' do
        it 'gives a welcome message - and chooses option 1' do
            io = double :io
            alb_repo = double :alb_repo
            art_repo = double :art_repo
            expect(io).to receive(:puts).with("Welcome to the music library manager!").ordered
            expect(io).to receive(:puts).with("What would you like to do?
    1 - List all albums
    2 - List all artists").ordered
            expect(io).to receive(:gets).and_return("1").ordered
            expect(io).to receive(:puts).with("Here is the list of albums:\n* 1 - Doolittle\n* 2 - Surfer Rosa")
            app = Application.new('music_library_test', io, AlbumRepository.new, ArtistRepository.new,)
            app.run
        end

        it 'gives a welcome message - and chooses option 2' do
            io = double :io
            alb_repo = double :alb_repo
            art_repo = double :art_repo
            expect(io).to receive(:puts).with("Welcome to the music library manager!").ordered
            expect(io).to receive(:puts).with("What would you like to do?
    1 - List all albums
    2 - List all artists").ordered
            expect(io).to receive(:gets).and_return("2").ordered
            expect(io).to receive(:puts).with("Here is the list of artists:\n* 1 - Pixies\n* 2 - ABBA")
            app = Application.new('music_library_test', io, AlbumRepository.new, ArtistRepository.new,)
            app.run
        end

    end

end


# RSpec.describe Greeter do
#     it "greets the user" do
#       io = double :io
#       expect(io).to receive(:puts).with("What is your name?")
#       expect(io).to receive(:gets).and_return("Kay")
#       expect(io).to receive(:puts).with("Hello, Kay!")
  
#       greeter = Greeter.new(io)
#       greeter.greet
#     end