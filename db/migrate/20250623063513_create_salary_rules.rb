class CreateSalaryRules < ActiveRecord::Migration[8.0]
  def change
    create_table :salary_rules do |t|
      t.float :pf
      t.float :esi
      t.float :professional
      t.float :salaryadvance
      t.float :tds
      t.float :other

      t.timestamps
    end
  end
end
