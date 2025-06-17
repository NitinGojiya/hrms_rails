class AddStatusToLeaves < ActiveRecord::Migration[8.0]
  def change
    add_column :leaves, :status, :string, default: "pending"
  end
end
