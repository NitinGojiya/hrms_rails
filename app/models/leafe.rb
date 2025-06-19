class Leafe < ApplicationRecord
  belongs_to :user
  broadcasts_to ->(leave) { "leave_#{leave.id}" }, inserts_by: :prepend
  scope :accept, -> { where(status: "accept") }
  scope :pending, -> { where(status: "pending") }
  scope :casual, -> { where(leavetype: "casual", status: "accept") }
  scope :sick, -> { where(leavetype: "sick", status: "accept") }
end
