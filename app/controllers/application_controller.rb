class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def welcome
    render '/layouts/welcome'
  end

  def angular
    render '/layouts/angular', layout: 'angular'
  end

  def current_user
    if session[:current_user_id]
      @current_user ||= User.find_by_id(session[:current_user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    !!current_user
  end

  def require_current_user
    redirect_to root_path unless logged_in?
  end

  def log_out!
    session[:session_token] = nil
  end

end
