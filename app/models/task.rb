class Task < ApplicationRecord
 belongs_to :project
  # Optional: If tasks are assigned to users
  belongs_to :assigned_user, class_name: "User", optional: true
end
