class MenuItemsController < ApplicationController
  def create
    @menu_item = MenuItem.new(menu_item_params)
    @menu_item.description = @menu_item.recipe.description
    @menu_item.price = 0
    if @menu_item.save
      redirect_to recipes_path
      flash[:success] = "#{@menu_item.recipe.name} was saved to #{@menu_item.menu.title}"

    else
      @errors = "Error fix"
      render "/recipes/index"
    end
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    if @menu_item.update_attributes(menu_item_params)
      redirect_to menu_path(@menu_item.menu)
    else
      @menu = @menu_item.menu
      @errors = @menu_item.errors.full_messages
      render "/menus/show"
    end
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy
    redirect_to menu_path(@menu_item.menu)
  end

  def menu_item_params
    params.require(:menu_item).permit(:price, :description, :recipe_id, :menu_id)
  end

end
