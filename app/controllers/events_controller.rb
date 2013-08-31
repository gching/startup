class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @user = User.find(params[:user_id])
    @events = @user.events.scoped  
    @events = @events.after(params['start']) if (params['start'])
    @events = @events.before(params['end']) if (params['end'])

  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @user = User.find(@event.user_id)
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @user = User.find(params[:user_id])
  
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @user = User.find(params[:user_id])
    authorize! :edit, @event, :message => 'You are not authorized to perform this action.'
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    @user = User.find(params[:event][:user_id])
    respond_to do |format|
      if @event.save
        format.html { redirect_to user_event_path(user_id: @user.id, id: @event.id), notice: 'Event was successfully created.' }
        format.json { render 'show', status: :created, location: user_event_path(user_id: @user.id, id: @event.id) }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    @user = User.find(params[:user_id])
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to user_event_path(user_id: @user.id, id: @event.id), notice: 'Event was successfully updated.' }
        format.json { render 'show' }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @user = User.find(params[:user_id])
    @event.destroy
    

    respond_to do |format|
      format.html { redirect_to user_events_path(@user) }
      format.json { render json: {:success => true} }
    end
  end
end
