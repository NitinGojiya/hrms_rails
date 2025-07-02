class Profile < ApplicationRecord
  belongs_to :user
  validates :employee_name, :father_name, :mother_name, presence: true, length: { maximum: 30 }
  validates :department, presence: true
  validates :job_title, presence: true
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
  validates :city, presence: true
  validates :acount_number, format: { with: /\A\d{14}\z/, message: "must be 14 digits" }
end
