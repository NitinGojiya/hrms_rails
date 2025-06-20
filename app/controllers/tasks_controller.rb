class TasksController < ApplicationController
  include Authentication
  def taskcreate
    @task = Task.new(task_params)
    if @task.save
      redirect_to "/admins/employee/target", notice: "Task add successfully."
    else
      flash[:alert] = "There was an error submitting your Task."
      redirect_to "/admins/employee/target"
    end
  end

  def taskmanage
    task = Task.find(params[:id])
    case params[:status]
    when "process"
      task.update(status: "process")
    when "completed"
      task.update(status: "completed")
    end

    redirect_back fallback_location: "/", notice: "Task #{task.status}"
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :project_id, :assigned_user_id, :start_date, :end_date)
  end
end
