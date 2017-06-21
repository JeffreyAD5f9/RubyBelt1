class UsersController < ApplicationController
#  before_action :user_authorized, only: [:enter]
#  before_action :user_logdin, only: [:new]

  def new

  end

  def create
    user = User.create(user_params)
    if user.valid?
      session[:userId] = user.id
      puts "User ID"
      puts session[:userId]
      redirect_to "/ideas"
    else
      flash[:regisErrors] = user.errors.full_messages
      redirect_to "/"
    end
  end

  def display
    @user = User.find(params[:id])
    @ideas_liked = @user.ideas_liked.includes(:likes)
  end

  def logout

  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
