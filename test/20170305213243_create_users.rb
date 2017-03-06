class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, limit: 100
      t.string :username, limit: 50
      t.string :password, limit: 200

      t.timestamps
    end
  end
end
