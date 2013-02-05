class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.integer :staffnum
      t.text :fname
      t.text :minitial
      t.text :lname
      t.string :level
      t.string :address
      t.integer :telnum
      t.integer :cellnum

      t.timestamps
    end
  end
end
