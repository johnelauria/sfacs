class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :transaction_id
      t.integer :amount
      t.string :sy

      t.timestamps
    end
  end
end
