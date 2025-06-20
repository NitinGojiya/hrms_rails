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

  private

  def salary_params
    params.require(:salary).permit(:salary, :user_id)
  end
end
