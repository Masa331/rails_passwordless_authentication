class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.id
  end

  # If i don't find a user from session i return null object
  def current_user
    User.find_by(id: session[:user_id]) || NullUser.new
  end
end
