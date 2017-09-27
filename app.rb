require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/recipe")
require("./lib/category")
require("./lib/ingredient")
require("pg")
require("pry")

get('/') do
  @recipes = Recipe.all
  @categories = Category.all
  erb(:index)
end

post('/recipes') do
  @recipes = Recipe.all
  title = params['title']
  instructions = params['instructions']
  rating = params['rating']
  @recipe = Recipe.new({title: title, instructions: instructions, rating: rating})
  @recipe.save()
  erb(:recipe)
end

get('/recipes/:id') do
  @ingredients = Ingredient.all
  # @instructions = Instruction.all
  @recipe = Recipe.find(params[:id].to_i)
  erb(:recipe)
end

post('/recipes/:id') do

  instructions = params['instructions']
  ingredient = params['ingredient']
  @ingredient = Ingredient.new({name: ingredient})
  @ingredient.save()
  @recipe = Recipe.find(params[:id].to_i)
  @recipe.ingredients.push(@ingredient)
  @recipe.save
  redirect "/recipes/#{@recipe.id}"
end
