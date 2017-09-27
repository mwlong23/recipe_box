class RenameInstructionsFromrecipes < ActiveRecord::Migration[5.1]
  def change
    change_column(:recipes, :instruction, :text)
  end
end
