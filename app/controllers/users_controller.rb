class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index 
    @users = User.all
  end


  def show
    #@goals = @user.received_goals
    @user = User.find(params[:id])
    @events = @user.events.scoped
    @photos = @user.photos
    @reviews = @user.reviews
  end
  
  def update
    @user = User.find(params[:id])
    authorize! :update, @user, :message => 'You can not update another user\'s information.'
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end






end