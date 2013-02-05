class AddDetailssToGrade < ActiveRecord::Migration
  def change
    add_column :grades, :first_quarter_quiz, :integer
    add_column :grades, :first_quarter_seatwork, :integer
    add_column :grades, :first_quarter_project, :integer
    add_column :grades, :first_quarter_assignment, :integer
    add_column :grades, :first_quarter_exam, :integer
    add_column :grades, :first_quarter_attendance, :integer
    add_column :grades, :first_quarter_recitation, :integer
  end
end
