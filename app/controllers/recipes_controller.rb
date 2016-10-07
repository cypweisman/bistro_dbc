class RecipesController < ApplicationController
  include RecipeHelper

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
    if @recipe.save
      saved_ingredients_and_errors = create_ingredients(@recipe.id)
      @ingredients = saved_ingredients_and_errors[:ingredients]
      @errors = saved_ingredients_and_errors[:errors]
      if @errors == []
        redirect_to user_path(@user)
      else
        @recipe.destroy
        @ingredients.each { |ingredient| ingredient.destroy }
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

  def create_ingredients(recipe_id)
    ingredients = []
    errors = []
    collect_ingredients_params.each do |ingred_key, ingred_data|
      ingredients_hash = set_ingredient_hash(ingred_data[:name], ingred_data[:amount], ingred_data[:measurement])
      if no_blank_fields?(ingredients_hash) #if it doesn't have blank fields
        ingredient = Ingredient.new(ingredients_hash) # instantiate new ingredient with hash
        ingredient.recipe_id = recipe_id
        if ingredient.save #if doesn't save, add to errors
          ingredients << ingredient #add to ingredients array
        else
          errors << "One or more recipes did not save, please review and try again"
        end
      end
    end
    {ingredients: ingredients, errors: errors.uniq!} #send ingredients and one error to create
  end

  def collect_ingredients_params
    params.select { |param_key, param_hash| param_key.include? "ingredient" }
  end

  def set_ingredient_hash(name, amount_num, measurement)
    if amount_num != '' && measurement != ''
      {name: name, amount: (amount_num + ' ' + measurement)}
    else
      {name: name, amount: ''}
    end
  end

  def no_blank_fields?(ingredient_hash)
    ingredient_hash[:name] != '' && ingredient_hash[:amount] != ''
  end

  def ingredients_params
    ingredients_params = params.require(:ingredients).permit(:name, :amount, :measurement)
  end


end
