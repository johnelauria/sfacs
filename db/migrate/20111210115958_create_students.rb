class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.integer :studnum
      t.text :fname
      t.text :minitial
      t.text :lname
      t.string :level
      t.string :curri
      t.string :address
      t.integer :telnum
      t.integer :cellnum

      t.timestamps
    end
  end
end
