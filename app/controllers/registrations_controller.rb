class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:new]
  before_action :isAdmin?, only: [ :destroy]
  before_action :isThisMyRecord? , only: [:edit, :update]
  # GET /registrations
  # GET /registrations.json
  def index
    if params[:event_id]
      set_event
      @registrations = @event.registrations
    else
      @registrations = Registration.all
    end
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    #binding.pry
    @registration = Registration.new
  end
  
  # GET /registrations/1/dit
  def edit
    @event = @registration.event
  end

  # POST /registrations
  # POST /registrations.json
  def create
    #binding.pry
    @registration = Registration.new(registration_params)
    @event = @registration.event
      if @registration.save
        redirect_to registration_path(@registration)
      else
        render :new
      end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
      if @registration.update(registration_params)
        redirect_to events_url
      else
        render :edit
      end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    redirect_to registrations_url
  end

  private
  def isThisMyRecord?
    # edit if it is your own registration
    if !(@registration.user==current_user)
      error= "#{current_user.email} is not authorized to modify registration of #{@registration.user.email}"
      redirect_to user_path(current_user), alert:error
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  #
    def set_registration
      @registration = Registration.find_by(id: params[:id])
    end
  def set_event
    @event= Event.find_by(id: params[:event_id])
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:rsvp, :comment, :user_id, :event_id)
    end
end
