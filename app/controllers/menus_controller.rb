class MenusController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @menu = Menu.new
  end

  def create
    @user = User.find(params[:user_id])
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menu_path(@menu)
    else
      @errors = @menu.errors.full_messages
      render :new
    end
  end

  def edit
    @menu = Menu.find(params[:id])
    if @menu.user_id == current_user.id
      render :edit
    else
      redirect_to root_url
    end
  end

  def update
    @user = User.find(current_user.id)
    @menu = Menu.find(params[:id])
    if @menu.update_attributes(menu_params)
      redirect_to menu_path(@menu)
    else
      @errors = @menu.errors.full_messages
      render :edit
    end
  end

  def destroy
    user = User.find(current_user.id)
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to user_path(user)
  end

  def show
    @menu = Menu.find(params[:id])
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :description, :user_id)
  end
end
