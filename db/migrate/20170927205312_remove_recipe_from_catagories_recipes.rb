class RemoveRecipeFromCatagoriesRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column(:categories_recipes, :recipe, :string)
  end
end
