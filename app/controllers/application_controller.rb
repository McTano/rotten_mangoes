class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def restrict_access
    unless current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_admin
    unless current_user.admin
      flash[:alert] = "You do not have permission to see that."
      redirect_to movies_path
    end
  end

  helper_method :current_user
  helper_method :require_admin



end
