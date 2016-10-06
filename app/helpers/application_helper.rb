module ApplicationHelper

  def logged_in?
    if session[:user_id]
      return true
    end
  end

  def current_user
    @user ||= User.find(session[:user_id]) if logged_in?
  end
end
