class AddDetailsstwoToGrade < ActiveRecord::Migration
  def change
    add_column :grades, :second_quarter_quiz, :integer
    add_column :grades, :second_quarter_seatwork, :integer
    add_column :grades, :second_quarter_project, :integer
    add_column :grades, :second_quarter_assignment, :integer
    add_column :grades, :second_quarter_exam, :integer
    add_column :grades, :second_quarter_attendance, :integer
    add_column :grades, :second_quarter_recitation, :integer
  end
end
