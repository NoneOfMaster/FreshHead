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

    ## that ended up being alot of logic - move it to the model
    def set_stats
      ordered_complete_batches = @user.user_batches.where(complete: true).order(:created_at)
      @total_complete = ordered_complete_batches.count

      streak_finder = {current_streak: 0, longest_streak: 0, last_date: 0}
      ordered_complete_batches.each {|batch|
        this_date = batch.created_at.to_date
        last_date = streak_finder[:last_date]
        if last_date != 0

          diff = (this_date - last_date).to_i

          if diff == 1
            streak_finder[:current_streak] = streak_finder[:current_streak] + 1
          else
            streak_finder[:current_streak] = 1
          end

          streak_finder[:longest_streak] = [streak_finder[:current_streak],streak_finder[:longest_streak]].max
          streak_finder[:last_date] = this_date

        else
          streak_finder[:current_streak] = 1
          streak_finder[:last_date] = this_date
        end
      }
      @longest_streak = streak_finder[:longest_streak]
      @current_streak = streak_finder[:current_streak]
    end

    def user_params
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :admin)
    end
end