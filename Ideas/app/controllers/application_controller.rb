class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    puts "Current User Trigger"
    User.find(session[:userId]) if session[:userId]
  end
  helper_method :current_user

  def user_authorized
    redirect_to '/' unless session[:userId]
  end
  helper_method :user_authorized

  def user_logdin
    redirect_to '/ideas' if session[:userId]
  end
end
