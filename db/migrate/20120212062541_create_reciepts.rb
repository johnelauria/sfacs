class CreateReciepts < ActiveRecord::Migration
  def change
    create_table :reciepts do |t|
      t.integer :transaction_id
      t.integer :cashier_id
      t.integer :payment_id

      t.timestamps
    end
  end
end
