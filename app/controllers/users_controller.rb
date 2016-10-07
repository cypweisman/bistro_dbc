class UsersController < ApplicationController
  before_action :is_admin?, only: [:show]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
      if params[:search]
        #MENUS WITH THE NAME <CHOCOLATE>
       menu_names = @user.menu_name_search(params[:search])
        #THE MENU THAT INCLUDE RECIPES WITH NAME <CHCOLATE>
       recipe_menu_names = Recipe.recipe_menu_search(params[:search], current_user)
       @menus = menu_names.concat recipe_menu_names
      else
        @menus = @user.menus
      end
  end

  private

  def user_params
    params.require(:user).permit(:password, :username, :email)
  end

  def is_admin?
    if current_user
      if current_user.is_admin
        return true
      end
    end
  end

end
