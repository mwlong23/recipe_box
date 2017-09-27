class CreateRecipeIdColumnToCategoriesRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column(:categories_recipes, :recipe_id, :int)
  end
end
