class RenameCookingOrderToStep < ActiveRecord::Migration[6.1]
  def change
    rename_column :recipes, :cooking_order, :step
  end
end
