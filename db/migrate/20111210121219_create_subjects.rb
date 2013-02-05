class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :schdcode
      t.string :subjcode
      t.text :days
      t.integer :time1
      t.integer :time2
      t.integer :room
      t.integer :amount
      t.string :block
      t.string :tname
      t.integer :staffnum

      t.timestamps
    end
  end
end
