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

  private

  def menu_params
    params.require(:menu).permit(:title, :description, :user_id)
  end
end
