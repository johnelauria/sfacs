class CreateAssestmentlists < ActiveRecord::Migration
  def change
    create_table :assestmentlists do |t|
      t.integer :student_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
