class MenusController < ApplicationController
  def new
    if current_user.is_admin
      @user = User.find(params[:user_id])
      @menu = Menu.new
    else
      render "/partials/_404", layout: false
    end
  end

  def create
    if current_user.is_admin
      @user = User.find(params[:user_id])
      @menu = Menu.new(menu_params)
      if @menu.save
        redirect_to menu_path(@menu)
      else
        @errors = @menu.errors.full_messages
        render :new
      end
    else
      render "/partials/_404", layout: false
    end
  end

  def edit
    if current_user.is_admin
      @menu = Menu.find(params[:id])
      if @menu.user_id == current_user.id
        render :edit
      else
        redirect_to root_url
      end
    else
      render "/partials/_404", layout: false
    end
  end

  def update
    if current_user.is_admin
      @user = User.find(current_user.id)
      @menu = Menu.find(params[:id])
      if @menu.update_attributes(menu_params)
        redirect_to menu_path(@menu)
      else
        @errors = @menu.errors.full_messages
        render :edit
      end
    else
      render "/partials/_404", layout: false
    end
  end

  def destroy
    user = User.find(current_user.id)
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to user_path(user)
  end

  def print
    if current_user.is_admin
      @menu = Menu.find(params[:id])
      render :print, layout: false
    else
      render "/partials/_404", layout: false
    end
  end

  def show
    if current_user.is_admin
      @menu = Menu.find(params[:id])
    else
      render "/partials/_404", layout: false
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :description, :user_id)
  end
end
