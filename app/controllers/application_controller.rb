class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ## helper methods are made available to the views
  helper_method :current_user, :user_signed_in?

  def authorize
    if !user_signed_in?
      @user = User.new
      render "sessions/_form.html.erb"
    end
  end

  def authorize_admin
    authorize
    render :file => 'public/403.html', :status => :not_found, :layout => false if !current_user.admin
  end

  private

    def current_user
      @current_user = User.find_by(id: session["user_id"])
    end

    def user_signed_in?
      !!current_user
    end

end