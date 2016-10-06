class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @menus = Menu.all
    @menu_item = MenuItem.new

  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
