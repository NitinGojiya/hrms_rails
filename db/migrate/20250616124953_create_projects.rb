class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :p_name
      t.date :start_date
      t.date :end_date
      t.string :tech
      t.timestamps
    end
  end
end
