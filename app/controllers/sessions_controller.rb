class SessionsController < ApplicationController
  skip_before_filter :check_user, only: [:create, :new]
  before_filter :check_no_user, only: [:create, :new]

  # def create
  #   user = User.from_omniauth(env["omniauth.auth"])

  #   if user.persisted?
  #     session[:user_id] = user.id
  #     redirect_to root_path
  #   else
  #     redirect_to signin_path, flash: { error: user.errors.full_messages.join(", ") }
  #   end
  # end

  # def destroy
  #   session[:user_id] = nil
  #   redirect_to signin_path
  # end

  def new
  end

  private
    def check_no_user
      redirect_to root_path if current_user
    end
end
