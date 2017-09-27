class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table(:categories) do |c|
      c.column(:tag, :varchar)

      c.timestamps
    end
  end
end
