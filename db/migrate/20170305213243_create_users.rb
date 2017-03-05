class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, limit: 100
      t.string :username
      t.text :password

      t.timestamps
    end
  end
end
