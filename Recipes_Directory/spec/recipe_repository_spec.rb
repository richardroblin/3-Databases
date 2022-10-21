require 'recipe_repository'

def reset_recipe_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory' })
  connection.exec(seed_sql)
end
  
RSpec.describe RecipeRepository do

  before(:each) do 
    reset_recipe_table
  end

  context 'retrieves all records' do
    it 'returns two records' do
      repo = RecipeRepository.new
      recipes = repo.all
      expect(recipes.length).to eq 2
    end

    it  'returns soup for the first recipe' do
      repo = RecipeRepository.new
      recipes = repo.all
      expect(recipes.first.id).to eq '1'
      expect(recipes.first.name).to eq 'Tomato Soup'
      expect(recipes.first.average_cooking_time).to eq '5'
      expect(recipes.first.rating ).to eq '3'
    end

    it 'returns pizza for the second receipe' do
      repo = RecipeRepository.new
      recipes = repo.all
      expect(recipes[1].id).to eq '2'
      expect(recipes[1].name).to eq 'Pizza'
      expect(recipes[1].average_cooking_time).to eq  '10'
      expect(recipes[1].rating).to eq '5'
    end

  end

  context 'can search for records' do

    it 'finds the record with the first id' do
      repo = RecipeRepository.new
      recipes = repo.find(1)
      expect(recipes.id).to eq '1'
      expect(recipes.name).to eq 'Tomato Soup'
      expect(recipes.average_cooking_time).to eq '5'
      expect(recipes.rating).to eq '3'
    end

  end

end