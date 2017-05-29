class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.string :description
      t.timestamp :transaction_date
      t.decimal :grand_total, precision: 10, scale: 2
      t.decimal :subtotal, precision: 10, scale: 2
      t.decimal :tax_total, precision: 10, scale: 2
      t.decimal :discount_total, precision: 10, scale: 2
      t.decimal :tax_rate, precision: 10, scale: 2
      t.belongs_to :user
      t.timestamps
    end
  end
end
