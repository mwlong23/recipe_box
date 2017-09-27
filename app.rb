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
  @recipe = Recipe.create({title: title, instructions: instructions, rating: rating})
  erb(:recipe)
end

get('/recipes/:id') do
  @ingredients = Ingredient.all
  @instructions = Instruction.all
  @recipe = recipe.find(params[:id].to_i)
  erb(:recipe)
end

post('/recipes/:id') do
  instructions = params['instructions']
  @ingredients = Ingredient.all
  @recipe = Recipe.find(params[:id].to_i)
  erb(:recipe)
end

# get('/ingredients/:id') do
#   @ingredient = ingredient.find(params['id'])
#   erb(:ingredient)
# end
