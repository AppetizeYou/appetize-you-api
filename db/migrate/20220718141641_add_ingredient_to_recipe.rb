class AddIngredientToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :ingredient, :string, array: true, default: []
  end
end
