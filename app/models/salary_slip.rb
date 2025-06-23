class SalarySlip < ApplicationRecord
  belongs_to :user
  belongs_to :salary
  belongs_to :salary_rule
end
