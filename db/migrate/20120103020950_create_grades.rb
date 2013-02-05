class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :first_quarter
      t.integer :second_quarter
      t.integer :third_quarter
      t.integer :fourth_quarter

      t.timestamps
    end
  end
end
