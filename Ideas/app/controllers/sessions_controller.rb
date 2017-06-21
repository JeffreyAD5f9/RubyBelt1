class SessionsController < ApplicationController

  def create
    user = User.find_by(name: login_params[:logName])
    if user && user.authenticate(login_params[:logPassword])
      session[:userId] = user.id
      redirect_to "/ideas"
    else
      flash[:loginErrors] = user.errors.full_messages
      redirect_to "/"
    end
  end

  def destroy
      reset_session
      redirect_to "/"
  end

  private
    def login_params
      params.require(:login).permit(:logName, :logPassword)
    end
end
