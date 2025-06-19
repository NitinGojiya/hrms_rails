class AdminsController < ApplicationController
  include Authentication

  def index
    @user = Current.session.user
    @leaves_pending = Leafe.pending.order(updated_at: :desc)
    @leaves_accept = Leafe.accept.order(updated_at: :desc)
    @leaves = Leafe.all.order(updated_at: :desc)
  end
  def leave
    @user = Current.session.user

    @leaves_pending = Leafe.pending.order(updated_at: :desc)
    @leaves_accept = Leafe.accept.order(updated_at: :desc)
    @leaves = Leafe.all.order(updated_at: :desc)
  end

  def create
  end

  def employee
    @user = Current.session.user
    @leaves_pending = Leafe.pending
    @employees = User.all.order(created_at: :asc)
    @employees.where!(role: 0)
  end

  def viewemployee
    @user = Current.session.user
    @leaves_pending = Leafe.pending
    @profile = Profile.find(params[:id])
  end

  def employeetarget
    @user = Current.session.user
    @leaves_pending = Leafe.pending
    @projects = Project.all
    @employees = User.where(role: 0)
    @task = Task.new
  end
end
