class SessionsController < ApplicationController
  def new
    session[:user_id] = nil
  end

   def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render "new"
    end
  end

end
