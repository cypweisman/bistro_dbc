class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      @error = @recipe.errors.full_messages
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :user_id, :directions, :prep_time, :category_id)
  end

end
