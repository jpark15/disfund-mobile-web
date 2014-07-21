class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :check_user

  def check_user
    current_uri = request.env['PATH_INFO']
    unless current_uri == new_user_session_path ||
            current_uri == new_user_registration_path ||
            current_uri == new_user_password_path
      redirect_to new_user_session_path unless current_user
    end
  end
end
