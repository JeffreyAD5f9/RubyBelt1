class LikesController < ApplicationController
  before_action :user_authorized, only: [:create]

  def create
    Like.create(user: current_user, idea: Idea.find(params[:id]))
    redirect_to '/ideas'
  end

  def destroy
    Like.find_by(user: current_user, idea: Idea.find(params[:id])).destroy
    redirect_to '/ideas'
  end

end
