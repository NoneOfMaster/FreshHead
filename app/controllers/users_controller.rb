class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :index, :update, :destroy]
  before_action :authorize_admin, only: [:index]

  def index
    @users = User.all
  end

  def show
    set_stats
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session["user_id"] = @user.id
      redirect_to root_path, :notice => "Thanks, #{@user.user_name}, for signing up!"
    else
      render :new, notice: "that's invalid for some reason."
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    reset_session
    redirect_to root_path
  end

  private
    def set_user
      @user = User.find_by(id: params[:id])
    end

    def set_stats
      user_stats = @user.get_stats
      @total_complete = user_stats[:total_complete]
      @current_streak = user_stats[:current_streak]
      @longest_streak = user_stats[:longest_streak]
    end

    def user_params
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :admin)
    end
end