class TasksController < ApplicationController
  def index
  end

  def taskcreate
    @task = Task.new(task_params)

    if @task.save
      redirect_to "/admins/employee/target", notice: "Task add successfully."
    else
      flash[:alert] = "There was an error submitting your Task."
      redirect_to "/admins/employee/target"
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :project_id, :assigned_user_id)
  end
end
