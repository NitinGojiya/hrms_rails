class LeavesController < ApplicationController
  include Authentication
  def new
     @session = Current.session
    @user = @session.user

    @leave = @user.leaves.new
  end
  def create
    @session = Current.session
    @user = @session.user

    @leave = @user.leaves.new(leave_params)

    if @leave.save
      redirect_to root_path, notice: "Leave application submitted successfully."
    else
      flash[:alert] = "There was an error submitting your leave."
      redirect_to root_path # Or re-render index if needed
    end
  end

  private

  def leave_params
    params.require(:leafe).permit(:leavetype, :start_date, :end_date, :subject, :description)
  end
end
