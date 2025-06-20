class AdminsController < ApplicationController
  include Authentication
  before_action :require_admin!
  # allow_unauthenticated_access only: %i[ leave ]
  # dashboard for admin "/admins/dashboard"
  def index
    common_object
  end

  #  for admin  leave manage "/admins/leave"
  def leave
     # Leafe.all
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
    @tasks = Task.all.order(updated_at: :desc)
    @task = Task.new
  end

  def payroll
    common_object
    @salary = Salary.new
    @salaries = Salary.all
  end

  private
    def common_object
      @leaves_pending = Leafe.pending.order(updated_at: :desc)
      @user = Current.session.user
      @leaves_accept = Leafe.accept.order(updated_at: :desc)
      @leaves = Leafe.all.order(updated_at: :desc)
      @employees = User.where(role: 0).order(created_at: :desc)
    end
end
