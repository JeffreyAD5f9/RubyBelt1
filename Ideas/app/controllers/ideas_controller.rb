class IdeasController < ApplicationController
#before_action :user_authorized, only: [:index, :create]

  def index
    user = current_user()
    puts "Current User"
    @user = user
    @ideas = Idea.all.includes(:likes, :user).sort_by { |idea| idea.likes.length }.reverse
    @ideas_liked_ids = user.ideas_liked_ids
  end

  def display
    user = current_user()
    @users = User.all
    @idea = Idea.find(params[:id])
  end

  def create
    idea = Idea.create(ideaParams.merge(user: current_user))
    if idea.valid?
      redirect_to '/ideas'
    else
      flash[:ideaErrors] = idea.errors.full_messages
      redirect_to "/users/#{session[:userId]}"
    end
  end

  def destroy
    Idea.destroy(params[:id])
    redirect_to '/ideas'
  end

  private
    def ideaParams
      params.require(:idea).permit(:idea)
    end

end
