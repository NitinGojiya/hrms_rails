class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.references :project, null: false, foreign_key: true
      t.references :assigned_user, foreign_key: { to_table: :users } # optional
      t.timestamps
    end
  end
end
