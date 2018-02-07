class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :is_authenticated?

  def current_user
    session[:name]
  end

  def is_authenticated?
    if !current_user
      flash[:message] = "Must be logged in"
      redirect_to login_path
    end
  end

end
