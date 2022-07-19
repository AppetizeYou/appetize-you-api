class Recipe < ApplicationRecord
  belongs_to :author, class_name: "User"

  belongs_to :type_category
  belongs_to :occasion_category
  belongs_to :main_ingredient_category
  belongs_to :cooking_method_category

  def beautify_recipe
    return(
      {
        title: self.title,
        serve: self.serve,
        author: self.author.username,
        updated_at: self.updated_at,
        type_category: self.type_category.name,
        occasion_category: self.occasion_category.name,
        main_ingredient_category: self.main_ingredient_category.name,
        cooking_method_category: self.cooking_method_category.name,
        ingredient: Recipe.format_ingredient(self.ingredient),
        cooking_order: self.cooking_order
      }
    )
  end

  def self.format_ingredient(ingredients)
    formatted_ingredient = []
    ingredients.each { |ingredient| formatted_ingredient << ingredient.split(", ") }

    return formatted_ingredient
  end
end
