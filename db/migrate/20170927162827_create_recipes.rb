class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table(:recipes) do |r|
      r.column(:instructions, :text)
      r.column(:rating, :int)
      r.column(:ingredients, :varchar)

      r.timestamps()
    end
  end
end
