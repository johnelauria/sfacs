class AddDetailsqwaeToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :quiz, :integer
    add_column :subjects, :seatwork, :integer
    add_column :subjects, :exam, :integer
    add_column :subjects, :project, :integer
    add_column :subjects, :assignment, :integer
    add_column :subjects, :attendance, :integer
    add_column :subjects, :recitation, :integer
  end
end
