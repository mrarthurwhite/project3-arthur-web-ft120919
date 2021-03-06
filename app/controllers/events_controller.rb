class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :must_be_host_to_edit , only:[:edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    #binding.pry
    @event = Event.new
  end

  # GET /events/1/edit
  def edit

  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.host = current_user
      if @event.save
        redirect_to event_path(@event)
      else
        render :new
      end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update

      if @event.update(event_params)
        redirect_to event_path(@event)
      else
        render :edit
      end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    redirect_to events_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.

  def must_be_host_to_edit
    if !@event.isHost?(current_user)
      error= "You are not a host of event titled : #{@event.title}"
      redirect_to user_path(current_user), alert:error
    end
  end

    def set_event
      @event = Event.find_by(id: params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :location, :description, :meeting_datetime, :user_id)
    end
end
