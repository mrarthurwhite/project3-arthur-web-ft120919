class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :isAdmin?, only: [:index, :edit, :destroy]
  before_action :isThisMyRecord?, only:[:show]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # logging into the application
  def signin
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      # success
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end


  def create_with_google_oauth
    #binding.pry
    omniauth_hash = request.env['omniauth.auth']
    @user = User.find_or_create_by(email: omniauth_hash['info']['email']) do |u|
      u.password = SecureRandom.hex
      u.name = omniauth_hash['info']['name']
    end
    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end


  def logout
    #https://apidock.com/rails/ActionController/Base/reset_session
    reset_session
    redirect_to '/'
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to user_path(@user)
      else
        render :new
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  #
  def isThisMyRecord?
    # edit if it is your own registration
    if !(@user==current_user)
      error= "#{current_user.email} is not authorized to view the profile of another user."
      redirect_to user_path(current_user), alert:error
    end
  end
  #
    def set_user
      @user = User.find_by(id: params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
