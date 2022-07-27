class Recipe < ApplicationRecord
  belongs_to :author, class_name: "User"

  belongs_to :type_category
  belongs_to :occasion_category
  belongs_to :main_ingredient_category
  belongs_to :cooking_method_category

  #   has_one_attached :image

  def beautify_recipe
    return(
      {
        title: self.title,
        serve: self.serve,
        author: self.author.username,
        created_at: self.created_at,
        updated_at: self.updated_at,
        type_category_id: self.type_category.id,
        occasion_category_id: self.occasion_category.id,
        main_ingredient_category_id: self.main_ingredient_category.id,
        cooking_method_category_id: self.cooking_method_category.id,
        ingredients: self.ingredients,
        steps: self.steps
      }
    )
  end
end
