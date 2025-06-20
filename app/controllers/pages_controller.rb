class PagesController < ApplicationController
  include Authentication
  before_action :require_user!
  def index
    @user = Current.session.user
    @profile = @user.profile
    if params[:status].present?
      @todos = @user.assigned_tasks.where(status: params[:status]).order(created_at: :desc)
    else
      @todos = @user.assigned_tasks.order(updated_at: :desc)
    end
    @todos = Array(@todos)
    @casual_leave = @user.leaves.casual
    @accept_leave = @user.leaves.accept
    @sick_leave = @user.leaves.sick
    @leave = @user.leaves.new
  end
end
