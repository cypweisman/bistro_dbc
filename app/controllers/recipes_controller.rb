class RecipesController < ApplicationController
  def index
    @menus = Menu.all
    @menu_item = MenuItem.new
    if params[:search]
      results_recipes = Recipe.recipe_search(params[:search])
      results_ingredients_recipes = Ingredient.ingredient_search(params[:search])
      @recipes = results_recipes.concat results_ingredients_recipes
    else
      @recipes = Recipe.all
    end


  end

  def show
    @menu_item = MenuItem.new
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @user = User.find(params[:user_id])
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @recipe = Recipe.new(recipe_params)
    @ingredient = Ingredient.new(ingredients_params)
    if @recipe.save
      @ingredient.recipe_id = @recipe.id
      if @ingredient.save
        redirect_to recipe_path(@recipe)
      else
        @recipe.destroy
        @errors = ['Please make sure all ingredient fields have been filled']
        render :new
      end
    else
      @errors = @recipe.errors.full_messages
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :user_id, :directions, :prep_time, :category_id)
  end

  def ingredients_params
    ingredients_params = params.require(:ingredients).permit(:name, :amount, :measurement)
    { name: ingredients_params[:name], amount: (ingredients_params[:amount] + ' ' + ingredients_params[:measurement])}
  end

end
