class RenameIngredientToIngredients < ActiveRecord::Migration[6.1]
  def change
    rename_column :recipes, :ingredient, :ingredients
  end
end
