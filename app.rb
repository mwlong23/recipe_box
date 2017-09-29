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
  ingredient = params['ingredient']
  @ingredient = Ingredient.new({name: ingredient})
  @ingredient.save()
  @recipe = Recipe.find(params[:id].to_i)
  @recipe.ingredient.push(@ingredient)
  @recipe.save
  redirect "/recipes/#{@recipe.id}"
end

patch('/recipes/:id') do
  instruction = params['instructions']
  @recipe = Recipe.find(params[:id].to_i)
  @recipe.instructions = instruction
  @recipe.save
  redirect "/recipes/#{@recipe.id}"
end

get('/ingredient_edit/:id') do
  recipe_id = params['id']
  ingredient_id = params['ingredient_id']
  @recipe = Recipe.find(recipe_id)
  @ingredient = Ingredient.find(ingredient_id)
  erb(:ingredient_edit)
end

patch('/ingredient_edit/:id') do
  update_ingredient = params['update_ingredient']
  @recipe_id = params['id']
  @ingredient_id = params['ingredient_id']
  @recipe = Recipe.find(@recipe_id)
  @ingredient = Ingredient.find(@ingredient_id)
  updated_ingredient = @ingredient.update({name: update_ingredient})
  redirect "/recipes/#{@recipe.id}"
end

delete('/ingredient_edit/:id') do
  update_ingredient = params['update_ingredient']
  @recipe_id = params[:id]
  @ingredient_id = params['ingredient_id']
  this_ingredient = Ingredient.find(@ingredient_id)
  @recipe = Recipe.find(@recipe_id)
  @recipe.ingredient.destroy(this_ingredient)
  redirect "/recipes/#{@recipe.id}"
end
