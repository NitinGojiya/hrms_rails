class CreateLeaveDeatils < ActiveRecord::Migration[8.0]
  def change
    create_table :leave_deatils do |t|
      t.string :employee_type
      t.integer :sick_leave
      t.integer :casual_leave
      t.integer :emergency_leave

      t.timestamps
    end
  end
end
