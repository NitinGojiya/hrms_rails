class SalariesController < ApplicationController
  include Authentication
  def salarycreate
     @salary = Salary.new(salary_params)
    if @salary.save
      redirect_to "/admins/employee/payroll", notice: "Salary add successfully."
    else
      flash[:alert] = "Salary Alredy Added."
      redirect_to "/admins/employee/payroll"
    end
  end

  def salaryupdate
   @salary = Salary.find(params[:salary][:id])
    @salary.salary = params[:salary][:salary]
    if @salary.save
      redirect_to "/admins/employee/payroll", notice: "Salary updated successfully."
    else
      flash[:alert] = "Salary updated in error."
      redirect_to "/admins/employee/payroll"
    end
  end

  def index
    @user = Current.session.user
    @salaryrule = SalaryRule.first
  end

  private

  def salary_params
    params.require(:salary).permit(:salary, :user_id)
  end
end
