class SessionsController < ApplicationController

  def new
    @user = User.new
    @return_url = session_params[:return_url]
  end

  def create
    @user = User.where(email: session_params[:email]).first
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      notice = "Welcome back, #{@user.user_name}."
      # refactor below to account referer is the signup page, or is offsite
      # session_params[:return_url].empty? ? session[:return_to] = request.referer : session[:return_to] = session_params[:return_url]
      # redirect_to session.delete(:return_to), :notice => notice
      # meantime:
      redirect_to root_path, :notice => notice
    else
      notice = "Username or password not found."
      redirect_to request.referer, :notice => notice
    end
  end

  def destroy
    reset_session
    ##for security this should also be used after a certain amount of inactive time has elapsed?
    redirect_to root_path
  end

  private
    def session_params
      params.require(:user).permit(:email, :password, [:return_url])
    end

end
