class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.string :employee_name
      t.string :department
      t.string :job_title
      t.string :phone_number
      t.string :city
      t.string :father_name
      t.string :mother_name
      t.string :acount_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
