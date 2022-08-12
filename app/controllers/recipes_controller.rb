class RecipesController < ApplicationController
    before_action :authenticate_user, except: %i[index show show_weekly show_monthly]
    before_action :set_recipe, except: %i[index create show_weekly show_monthly my_post]

    # return all recipes from database
    def index
        @recipes = []
        Recipe.all.order("created_at DESC").each { |recipe| @recipes << RecipeSerializer.new(recipe).serializable_hash[:data][:attributes] }

        render json: @recipes, status: 200
    end

    # create new recipe and return if no error occurs
    def create
        @recipe = Recipe.create(recipe_params)
        if @recipe.errors.any?
            render json: @recipe.errors, status: :unprocessable_entity
        else
            render json: @recipe
        end
    end

    # return selected recipe details
    def show
        if @recipe
            render json: RecipeSerializer.new(@recipe).serializable_hash[:data][:attributes], status: 200
        else
            render json: { error: "Recipe not found!" }, status: :not_found
        end
    end

    # return weekly recipes
    def show_weekly
        weekly_recipes = Recipe.where("created_at >= ? and created_at <= ?", Date.today.beginning_of_week, Date.today.end_of_week)
        if weekly_recipes
            @recipes = []
            weekly_recipes.each { |recipe| @recipes << RecipeSerializer.new(recipe).serializable_hash[:data][:attributes] }

            render json: @recipes
        end
    end

    # return monthly recipes
    def show_monthly
        monthly_recipes = Recipe.where("created_at >= ? and created_at <= ?", Date.today.beginning_of_month, Date.today.end_of_month)
        if monthly_recipes
            @recipes = []
            monthly_recipes.each { |recipe| @recipes << RecipeSerializer.new(recipe).serializable_hash[:data][:attributes] }

            render json: @recipes
        end
    end

    # return my recipes
    def my_post
        @recipes = []
        Recipe.where(author: current_user).order("created_at DESC").each { |recipe| @recipes << RecipeSerializer.new(recipe).serializable_hash[:data][:attributes] }

        render json: @recipes
    end

    # update recipe details
    def update
        if @recipe.update(recipe_params)
            render json: RecipeSerializer.new(@recipe).serializable_hash[:data][:attributes], status: 200
        else
            render json: @recipe.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @recipe.destroy
    end

    private

    # permit passed params and merge current user as author
    def recipe_params
        params.permit(:title, :serve, :type_category_id, :occasion_category_id, :main_ingredient_category_id, :cooking_method_category_id, :image, ingredients: [], steps: []).merge(author: current_user)
    end

    # select the recipe
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
end
