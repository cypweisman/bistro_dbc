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
