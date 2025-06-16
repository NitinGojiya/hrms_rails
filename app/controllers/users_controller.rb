class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }
  def index
  end
  def new
    unless authenticated?
      @user = User.new
    else
      redirect_to "/"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for(@user)
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end

private

def user_params
  params.require(:user).permit(:email_address, :password)
end
end
