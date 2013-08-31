class UsersController < ApplicationController
  def index 
    @users = User.all
  end


  def show
    #@goals = @user.received_goals
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

  def new
    @user = User.new
    @navbar = true
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "Welcome to CalTogether!" }
        #format.json { render 'show', status: :created, location: user_event_path(user_id: @user.id, id: @event.id) }
      else
        format.html { render action: "new" }
        #format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end


  end






end