class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    user = User.authenticate_by(email_address: user_params[:email_address], password: user_params[:password]) ||
          User.authenticate_by(username: user_params[:username], password: user_params[:password])

    if user
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end

  private
  def user_params
    permitted = params.permit(:email_address, :password)
    permitted[:username] = permitted[:email_address]
    permitted
  end
end
