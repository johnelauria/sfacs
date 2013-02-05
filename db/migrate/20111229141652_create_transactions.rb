class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :student_id
      t.string :sy
      t.integer :subjectamount
      t.integer :miscamount
      t.integer :paidamount

      t.timestamps
    end
  end
end
