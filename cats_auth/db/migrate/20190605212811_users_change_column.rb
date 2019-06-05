class UsersChangeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :username
    add_column :users, :user_name, :string, null: false
    add_index :users, :user_name, unique: true
  end
end
