class CategoriesController < ApplicationController
  def show
    @categories = {
        :type_categories => TypeCategory.all,
        :occasion_categories => OccasionCategory.all,
        :main_ingredient_categories => MainIngredientCategory.all,
        :cooking_method_categories => CookingMethodCategory.all
    }

    render json: @categories
  end
end
