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
    @user = User.find(params[:user_id])
    @menu = Menu.new(menu_params)
    if current_user.is_admin && (@menu.user.id == session[:user_id])
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
    @menu = Menu.find(params[:id])
    if current_user.is_admin && (@menu.user.id == session[:user_id])
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
    @user = User.find(current_user.id)
    @menu = Menu.find(params[:id])
    if current_user.is_admin && (@menu.user.id == session[:user_id])
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
    if current_user.is_admin && (menu.user.id == session[:user_id])
      menu.destroy
      redirect_to user_path(user)
    else
      render "/partials/_404", layout: false
    end
  end

  def print
    @menu = Menu.find(params[:id])
    if current_user.is_admin && (@menu.user.id == session[:user_id])
      render :print, layout: false
    else
      render "/partials/_404", layout: false
    end
  end

  def show
    @menu = Menu.find(params[:id])
    if current_user.is_admin && (@menu.user.id == session[:user_id])
    else
      render "/partials/_404", layout: false
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :description, :user_id)
  end
end
