class CreateSalaries < ActiveRecord::Migration[8.0]
  def change
    create_table :salaries do |t|
      t.integer :salary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
