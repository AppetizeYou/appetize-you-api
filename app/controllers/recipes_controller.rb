class RecipesController < ApplicationController
    before_action :authenticate_user, except: %i[index show]
    before_action :set_recipe, except: %i[index create my_post]

    def index
        @recipes = []
        Recipe.all.order("created_at DESC").each { |recipe| @recipes << RecipeSerializer.new(recipe).serializable_hash[:data][:attributes] }

        render json: @recipes
    end

    def create
        @recipe = Recipe.create(recipe_params)
        if @recipe.errors.any?
            render json: @recipe.errors, status: :unprocessable_entity
        else
            render json: @recipe
        end
    end

    def show
        if @recipe
            render json: RecipeSerializer.new(@recipe).serializable_hash[:data][:attributes]
        else
            render json: { error: "Recipe not found!" }, status: :not_found
        end
    end

    def my_post
        @recipes = Recipe.where(author: current_user)
        
        render json: @recipes
    end

    def update
        if @recipe.update(recipe_params)
            render json: RecipeSerializer.new(@recipe).serializable_hash[:data][:attributes]
        else
            render json: @recipe.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @recipe.destroy
    end

    private

    def recipe_params
        params.permit(:title, :serve, :type_category_id, :occasion_category_id, :main_ingredient_category_id, :cooking_method_category_id, :image, ingredients: [], steps: []).merge(author: current_user)
    end

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
end
