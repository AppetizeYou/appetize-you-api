class AddCookingOrderToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :cooking_order, :text, array: true, default: []
  end
end
