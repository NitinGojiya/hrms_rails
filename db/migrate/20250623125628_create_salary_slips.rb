class CreateSalarySlips < ActiveRecord::Migration[8.0]
  def change
    create_table :salary_slips do |t|
      t.integer :basic_salary
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :salary, null: false, foreign_key: true
      t.belongs_to :salary_rule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
