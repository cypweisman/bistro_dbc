class MenuItemsController < ApplicationController
  def create
    if current_user.is_admin
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
    else
      render "/partials/_404", layout: false
    end
  end

  def update
    if current_user.is_admin
      @menu_item = MenuItem.find(params[:id])
      if @menu_item.update_attributes(menu_item_params)
        redirect_to menu_path(@menu_item.menu)
      else
        @menu = @menu_item.menu
        @errors = @menu_item.errors.full_messages
        render "/menus/show"
      end
    else
      render "/partials/_404", layout: false
    end
  end

  def destroy
    if current_user.is_admin
      @menu_item = MenuItem.find(params[:id])
      @menu_item.destroy
      redirect_to menu_path(@menu_item.menu)
    else
      render "/partials/_404", layout: false
    end
  end

  def menu_item_params
    params.require(:menu_item).permit(:price, :description, :recipe_id, :menu_id)
  end

end
