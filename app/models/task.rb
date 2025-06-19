class Task < ApplicationRecord
  belongs_to :project
  before_create :status_initialize
  # Optional: If tasks are assigned to users
  belongs_to :assigned_user, class_name: "User", optional: true
  scope :pending, -> { where(status: "pending") }
  scope :process, -> { where(status: "process") }
  scope :completed, -> { where(status: "completed") }
  private

  def status_initialize
    self.status ||= "pending"
  end
end
