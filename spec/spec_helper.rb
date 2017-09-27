ENV['RACK_ENV'] = 'test'

require("sinatra/activerecord")
require 'rspec'
require 'pg'
require 'category'
require 'recipe'



RSpec.configure do |config|
  config.after(:each) do
    Category.all().each() do |category|
      category.destroy()
    end
    Recipe.all.each do |recipe|
      recipe.destroy()
    end
    Ingredient.all.each do |ingredient|
      ingredient.destroy()
    end
  end
end
