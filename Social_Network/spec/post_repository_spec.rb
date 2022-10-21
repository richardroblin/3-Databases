require 'post_repository'

def reset_posts_table
    seed_accounts_sql = File.read('spec/seeds_accounts.sql')
    seed_posts_sql = File.read('spec/seeds_posts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_accounts_sql)
    connection.exec(seed_posts_sql)
  end
  
RSpec.describe PostRepository do
    before(:each) do 
      reset_posts_table
    end
  
    context 'can retrieve all posts' do

        it 'gets all posts' do 
            repo = PostRepository.new
            posts = repo.all
            expect(posts.length).to eq 2
        end

        it 'gets the first post' do 
            repo = PostRepository.new
            posts = repo.all
            expect(posts[0].id).to eq '1'
            expect(posts[0].title).to eq 'My first post'
            expect(posts[0].content).to eq 'Hi everyone'
            expect(posts[0].number_of_views).to eq '5'
            expect(posts[0].account_id).to eq '1'

        end
    end

    context 'can find a specific post' do

        it 'finds a single account using id' do

            repo = PostRepository.new
            post = repo.find(1)

            expect(post.id).to eq '1'
            expect(post.title).to eq 'My first post'
            expect(post.content).to eq 'Hi everyone'

        end

    end

    context 'can add a post' do

        it 'adds a post' do

            repo =AccountRepository.new
            account = Account.new
            account.email = 'freddie@mercury.com'
            account.username  = 'freddiemercury'
            repo.create(account)

            repo =PostRepository.new
            post = Post.new
            post.title = 'Shout'
            post.content  = 'Aaaaaaa oooooh'
            post.number_of_views = '1000'
            post.account_id = 3
            repo.create(post)
            all_posts = repo.all
            expect(all_posts.length).to eq 3
        end
    end

    context 'can remove a post' do

        it 'deletes a single post' do

            repo = PostRepository.new
            post = repo.delete(1)
            expect(repo.all.length).to eq 1
        end
    end
end