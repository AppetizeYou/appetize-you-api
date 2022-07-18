class AddCategoriesToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :type_category, null: false, foreign_key: true
    add_reference :recipes, :occasion_category, null: false, foreign_key: true
    add_reference :recipes, :main_ingredient_category, null: false, foreign_key: true
    add_reference :recipes, :cooking_method_category, null: false, foreign_key: true
  end
end
