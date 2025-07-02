class Leafe < ApplicationRecord
  belongs_to :user

  # scope
  scope :accept, -> { where(status: "accept") }
  scope :pending, -> { where(status: "pending") }
  scope :casual, -> { where(leavetype: "casual", status: "accept") }
  scope :sick, -> { where(leavetype: "sick", status: "accept") }

  # validation
  validates :subject, :description, :start_date, :end_date, presence: true
end
