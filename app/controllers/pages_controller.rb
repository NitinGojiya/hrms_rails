class PagesController < ApplicationController
   include Authentication
  def index
    @session = Current.session
    @user = @session.user
  end
end
