class CreateLeaves < ActiveRecord::Migration[8.0]
  def change
    create_table :leaves do |t|
      t.string :leavetype
      t.string :subject
      t.string :description
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
