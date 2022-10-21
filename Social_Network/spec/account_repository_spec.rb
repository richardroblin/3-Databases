require 'account_repository'

def reset_accounts_table
    seed_sql = File.read('spec/seeds_accounts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end
  
RSpec.describe AccountRepository do
    before(:each) do 
      reset_accounts_table
    end
  
    context 'can retrieve all accounts' do

        it 'gets all acounts' do 
            repo = AccountRepository.new
            accounts = repo.all
            expect(accounts.length).to eq 2
        end

        it 'gets the first account' do 
            repo = AccountRepository.new
            accounts = repo.all
            expect(accounts[0].id).to eq '1'
            expect(accounts[0].email).to eq 'hello@world.com'
            expect(accounts[0].username).to eq 'helloworld'

            expect(accounts[1].id).to eq '2'
            expect(accounts[1].email).to eq 'joe@bloggs.com'
            expect(accounts[1].username).to eq 'joebloggs'

        end
    end

    context 'can find a specific account' do

        it 'finds a single account using id' do

            repo = AccountRepository.new
            account = repo.find(1)

            expect(account.id).to eq '1'
            expect(account.email).to eq 'hello@world.com'
            expect(account.username).to eq 'helloworld'

        end

    end

    context 'can add a user account' do

        it 'adds a user account' do

            repo =AccountRepository.new
            account = Account.new
            account.email = 'freddie@mercury.com'
            account.username  = 'freddiemercury'
            repo.create(account)
            all_accounts = repo.all
            expect(all_accounts.length).to eq 3
        end
    end

    context 'can remove a user account' do

        it 'deletes a single user' do

            repo = AccountRepository.new
            account = repo.delete(1)
            expect(repo.all.length).to eq 1
        end
    end
end