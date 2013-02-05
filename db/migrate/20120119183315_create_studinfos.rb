class CreateStudinfos < ActiveRecord::Migration
  def change
    create_table :studinfos do |t|
      t.string :fname
      t.string :minitial
      t.string :lname
      t.string :secret_question
      t.string :secret_answer

      t.timestamps
    end
  end
end
