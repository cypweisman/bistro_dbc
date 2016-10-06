class MenuItemsController < ApplicationController
  def create
    @menu_item = MenuItem.new(menu_item_params)
    @menu_item.description = @menu_item.recipe.description
    @menu_item.price = 0
    if @menu_item.save
      redirect_to recipes_path
    else
      @errors = "Error fix"
      render "/recipes/index"
    end

  end

  def menu_item_params
    params.require(:menu_item).permit(:recipe_id, :menu_id)
  end

end
