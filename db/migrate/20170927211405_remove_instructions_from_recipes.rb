class RemoveInstructionsFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column(:recipes, :instructions, :text)
  end
end
