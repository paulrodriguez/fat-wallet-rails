class ChangeUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :salt,:string
    add_index :users, :email
    add_index :users, :username
  end
  def down
    remove_column :users, :salt
  end
end
