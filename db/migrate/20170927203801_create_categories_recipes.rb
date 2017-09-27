class CreateCategoriesRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table(:categories_recipes) do |t|
      t.column(:catergory_id, :integer)
      t.column(:recipe, :integer)

      t.timestamps()
    end
  end
end
