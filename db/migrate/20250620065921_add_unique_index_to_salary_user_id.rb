class AddUniqueIndexToSalaryUserId < ActiveRecord::Migration[8.0]
  def change
    remove_index :salaries, :user_id if index_exists?(:salaries, :user_id)

    # Add a unique index to enforce has_one relationship at DB level
    add_index :salaries, :user_id, unique: true
  end
end
