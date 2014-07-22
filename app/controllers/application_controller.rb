class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # helper_method :current_user
  # before_filter :check_user

  # def check_user
  #   current_uri = request.env['PATH_INFO']
  #   unless current_uri == new_user_session_path ||
  #           current_uri == new_user_registration_path ||
  #           current_uri == new_user_password_path ||
  #           current_user
  #     redirect_to new_user_session_path
  #   end
  # end

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  private
  def check_admin
    unless current_user && current_user.admin
      flash[:error] = "You must be an admin for that action!"
      redirect_to root_path
    end
  end
end
