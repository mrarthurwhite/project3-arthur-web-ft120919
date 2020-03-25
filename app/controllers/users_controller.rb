class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:index, :edit, :delete]
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
        render :show
      else
        render :new
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if @user.update(user_params)
        render :show
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
    def set_user
      @user = User.find(params[:id])
    end

=begin
  def authorize
    if !User.isAdmin?(current_user)
      redirect_to events_path
    end
  end
=end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
