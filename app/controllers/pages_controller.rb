class PagesController < ApplicationController
   include Authentication
  def index
    @session = Current.session
    @user = @session.user
    @todos = @user.assigned_tasks.order(created_at: :desc)
    @todos = Array(@todos)
    @casual_leave = @user.leaves.casual
    @accept_leave = @user.leaves.accept
    @sick_leave = @user.leaves.sick
    @leave = @user.leaves.new
  end
end
