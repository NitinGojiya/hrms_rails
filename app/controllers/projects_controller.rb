class ProjectsController < ApplicationController
  include Authentication
  before_action :require_admin!
  def index
    @user = Current.session.user
    @leaves_pending = Leafe.pending
    @task = Task.new
    @projects = Project.all
    @project = Project.new
    @employees = User.all
  end

  def create
    @project = Project.new(project_params)
    if @project = Project.new(project_params).save
      redirect_to "/admins/projects", notice: "project add successfully."
    else
      flash[:alert] = "project Alredy Added."
      redirect_to "/admins/projects"
    end
  end

  private
    def project_params
      params.require(:project).permit(:p_name, :tech, :start_date, :end_date)
    end
end
