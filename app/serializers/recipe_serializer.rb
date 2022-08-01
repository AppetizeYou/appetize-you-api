class RecipeSerializer
    include JSONAPI::Serializer

    attributes :id, :title, :serve, :author, :created_at, :updated_at, :type_category_id, :occasion_category_id, :main_ingredient_category_id, :cooking_method_category_id, :image_url, :ingredients, :steps
end
