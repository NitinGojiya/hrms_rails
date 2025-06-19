class AdminsController < ApplicationController
  include Authentication
  # dashboard for admin "/admins/dashboard"
  def index
    common_object
  end

  #  for admin  leave manage "/admins/leave"
  def leave
    common_object
  end

  #  for admin  employee data  get  "/admins/employee"
  def employee
    common_object
  end

  #  for admin  get show one employee "/employee/profile/5"
  def viewemployee
    common_object
    @profile = Profile.find(params[:id])
  end

  #  for admin  task initialize and task create in task controller
  def employeetarget
    common_object
    @projects = Project.all
    @tasks = Task.all.order(created_at: :desc)
    @task = Task.new
  end

  private
    def common_object
      @leaves_pending = Leafe.pending.order(updated_at: :desc)
      @user = Current.session.user
      @leaves_pending = Leafe.pending.order(updated_at: :desc)
      @leaves_accept = Leafe.accept.order(updated_at: :desc)
      @leaves = Leafe.all.order(updated_at: :desc)
      @employees = User.where(role: 0).order(created_at: :desc)
    end
end
