class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :prepare_for_mobile

  if Rails.env.test?
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

  private
  def check_admin
    unless current_user && current_user.admin
      flash[:error] = "You must be an admin for that action!"
      redirect_to root_path
    end
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == '1'
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    #request.format = :mobile if mobile_device?
  end
end
