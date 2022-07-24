class TypeCategoriesController < ApplicationController
  def show
    @type_categories = TypeCategory.all

    render json: @type_categories
  end
end
